package wireframe

import grails.converters.*
class SignController {

	private static load_string = clojure.java.api.Clojure.var('clojure.core', 'load-string')
	private static sign_request = load_string.invoke('''

	(def aws-zone "ap-northeast-2")
	(def bucket "dicom-files")
	(def access-key (System/getenv "S3_UPLOADER_KEY"))
	(def secret-key (System/getenv "S3_UPLOADER_SECRET"))

	(require '[s3-beamer.handler :as s3])
	(fn [file-name mime-type]
		(pr-str
			(s3/sign-upload
			{:file-name file-name :mime-type mime-type}
			{:bucket bucket :aws-zone aws-zone :aws-access-key access-key :aws-secret-key secret-key :acl "private"
			 :upload-url "http://dicom-files.s3-accelerate.amazonaws.com"
		}
			)))''')

	def sign = {
		def file_name = params['file-name']
		def mime_type = params['mime-type']
		render sign_request.invoke(file_name, mime_type)
	}

}
