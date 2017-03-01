$(document).ready(function () {

    var data = {
        Head: '<h3 class="text-center">Head</h3><style>ul.tab {list-style-type: none;margin: 0;padding: 0;overflow: hidden;border: 1px solid #004080;background-color: #f1f1f1;}ul.tab li {float: left;}ul.tab li a {display: inline-block;text-align: center;padding: 14px 16px;text-decoration: none;transition: 0.3s;font-size: 17px;}ul.tab li a:hover {background-color: #004080;color: white;}ul.tab li a:focus, .active {background-color: #004080;color: white;}.tabcontent {display: none;padding: 6px 12px;border: 1px solid #004080;border-top: none;}</style><ul class="tab"><li><a class="tablinks active" onclick="openCity(event, \'Ear, Nose & Throat\')">Ear, Nose & Throat</a></li><li><a class="tablinks" onclick="openCity(event, \'Neuro\')">Neuro</a></li><li><a class="tablinks" onclick="openCity(event, \'Eyes\')">Eyes</a></li></ul><div id="Ear, Nose & Throat" class="tabcontent" style="display:block"><h3>Ear, Nose & Throat</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Inner ear abnormality</td><td>CT-ASG</td><td>MRI</td></tr><tr><td>Vastibular pathology</td><td>MRI</td><td>-</td></tr><tr><td>Cholesteatoma- congenital</td><td>CT- Masto- Iden</td><td>-</td></tr><tr><td>Cholesteatoma- acquired</td><td>MRI</td><td>-</td></tr><tr><td>N VIII pathology</td><td>MRI</td><td>-</td></tr><tr><td>Temporomandibular joint pathology</td><td>MRI</td><td>CT</td></tr><tr><td>Mastoiditis</td><td>CT-ASG</td><td>MRI</td></tr><tr><td>Middle ear abnormality</td><td>CT-ASG</td><td>MRI</td></tr><tr><td>Temporal bone pathology</td><td>CT-ASG</td><td>MRI</td></tr><tr><td>SOL in salivary gland</td><td>Ultrasound</td><td>CT or MRI</td></tr><tr><td>tumor in oropharynx</td><td>MRI</td><td>-</td></tr><tr><td>tumor in nasopharynx</td><td>MRI</td><td>-</td></tr><tr><td>Sialolithiasis</td><td>Sialography+Eisler</td><td>CT</td></tr><tr><td>Sinus pathology</td><td>CT</td><td>-</td></tr><tr><td>Soft tissue pathology</td><td>Xray and Echo</td><td>MRI</td></tr></tbody></table></div></div><div id="Neuro" class="tabcontent"><h3>Neuro</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Aneurysm</td><td>CT Angiography</td><td>DSA</td></tr><tr><td>Arteriovenous malformation</td><td>MRI/MRI Angiography</td><td>CT/CT Angiography</td></tr><tr><td>Bleeding (acute)</td><td>CT</td><td>-</td></tr><tr><td>Congenital deformity</td><td>MRI</td><td>-</td></tr><tr><td>Demyelination (multiple sclerosis)</td><td>MRI</td><td>-</td></tr><tr><td>Posterior fossa pathology</td><td>MRI</td><td>CT</td></tr><tr><td>Brainstem pathology</td><td>MRI</td><td>-</td></tr><tr><td>Cranial Nerve Pathology</td><td>MRI</td><td>-</td></tr><tr><td>Headache (unknown origin)</td><td>CT</td><td>MRI</td></tr><tr><td>Pituitary Gland and Sella Pathology</td><td>MRI</td><td>CT</td></tr><tr><td>Infarction (hemorhagic cerebral)</td><td>CT</td><td>MRI</td></tr><tr><td>Infarction posterior fossa</td><td>MRI</td><td>CT</td></tr><tr><td>Infection</td><td>MRI</td><td>CT</td></tr><tr><td>Metastases (cerebral, cerebellar, meningeal)</td><td>MRI</td><td>CT</td></tr><tr><td>Alzheimer/Dementia</td><td>MRI</td><td>-</td></tr><tr><td>Epilepsia tarda</td><td>MRI</td><td>-</td></tr><tr><td>Sinus Thrombosis</td><td>MRI+MRA</td><td>CT with contrast</td></tr><tr><td>TIA</td><td>CT</td><td>-</td></tr><tr><td>Trauma</td><td>CT</td><td>-</td></tr><tr><td>Tumor (cerebral or cerebellar)</td><td>MRI</td><td>CT</td></tr><tr><td>Superior vena cava syndrome</td><td>CT</td><td>-</td></tr><tr><td>Cervical plexus/ brachialis</td><td>MRI</td><td>-</td></tr><tr><td>Lumbar Plexus</td><td>CT with contrast</td><td>-</td></tr></tbody></table></div></div><div id="Eyes" class="tabcontent"><h3>Eyes</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Chiasm Pathology</td><td>MRI</td><td>-</td></tr><tr><td>Corpus alienum</td><td>Orbital X ray</td><td>CT</td></tr><tr><td>Exophtalmos</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Loss of Vision</td><td>MRI</td><td>-</td></tr><tr><td>Congenital Muscular</td><td>Ultrasound</td><td>MRI</td></tr><tr><td>Trauma, orbital fracture</td><td>Orbital X ray</td><td>CT</td></tr><tr><td>Tumor</td><td>Echo</td><td>MRI or CT</td></tr><tr><td>Vascular Pathology</td><td>Echo</td><td>MRI</td></tr></tbody></table></div></div><script>function openCity(evt, cityName) {var i, tabcontent, tablinks;tabcontent = document.getElementsByClassName("tabcontent");for (i = 0; i < tabcontent.length; i++) {tabcontent[i].style.display = "none";}tablinks = document.getElementsByClassName("tablinks");for (i = 0; i < tablinks.length; i++) {tablinks[i].className = tablinks[i].className.replace(" active", "");}document.getElementById(cityName).style.display = "block";evt.currentTarget.className += " active";}</script>',
        Neck: '<h3 class="text-center">Neck</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Abscess</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Neck cysts</td><td>Ultrasound</td><td>-</td></tr><tr><td>Lip cancer</td><td>MRI</td><td>Ultrasound and CT</td></tr><tr><td>Lymphoma</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Further analysis thyroid pathology</td><td>Ultrasound guided cytology</td><td>Trachea X ray</td></tr><tr><td>Inflammation</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Peritumoral tumor</td><td>MRI</td><td>-</td></tr><tr><td>SOL (space occupying lesion) </td><td>Ultrasound</td><td>MRI</td></tr><tr><td>tumor growth/staging in hypopharynx</td><td>MRI</td><td>-</td></tr><tr><td>tumor growth/staging in larynx</td><td>MRI</td><td>-</td></tr><tr><td>tumor growth/staging in nasopharynx</td><td>MRI</td><td>-</td></tr><tr><td>tumor growth/staging in oropharynx</td><td>MRI</td><td>-</td></tr><tr><td>Thyroid pathology</td><td>Trachea X ray and Ultrasound</td><td>Scinitigraphy scan</td></tr><tr><td>Screening swelling</td><td>Ultrasound (doppler)</td><td>CT</td></tr><tr><td>Tonque malignant study</td><td>MRI</td><td>-</td></tr><tr><td>Artery pathology </td><td>Doppler/duplex</td><td>MRI Angiography</td></tr></tbody></table></div>',
        Thorax: '<h3 class="text-center">Thorax</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Airtrapping</td><td>In- and Expiration Xray Thorax</td><td>-</td></tr><tr><td>Thoracic aortic aneurysms</td><td>CT</td><td>-</td></tr><tr><td>Aortic Dissection</td><td>CT</td><td>MRI</td></tr><tr><td>Bronchiectasis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Diaphragm movement (paradoxically)</td><td>Flouroscopy</td><td>-</td></tr><tr><td>Haemoptoe</td><td>Xray Thorax</td><td>CT</td></tr><tr><td>Cough and Dyspnoea</td><td>Xray Thorax</td><td>-</td></tr><tr><td>IFP or UIP </td><td>High Resolution CT</td><td>-</td></tr><tr><td>Sarcoidosis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Pneumoconiosis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Asbestosis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Pulmonary Embolism</td><td>CT Angiography</td><td>-</td></tr><tr><td>Biopsy Marker Pleural Fluid</td><td>Ultrasound</td><td>-</td></tr><tr><td>Metastases</td><td>CT</td><td>PET</td></tr><tr><td>Further Analysis abn on X Thorax</td><td>CT</td><td>-</td></tr><tr><td>Pericardial Fluid </td><td>Ultrasound</td><td>CT</td></tr><tr><td>Pericardial Fluid Drainage</td><td>Ultrasound Marking</td><td>CT</td></tr><tr><td>Pneumothorax </td><td>In and Expiration Xray Thorax</td><td>CT</td></tr><tr><td>Punction </td><td>CT</td><td>-</td></tr><tr><td>Sarcoidosis Pulmonary </td><td>High Resolution CT</td><td>-</td></tr><tr><td>Screening </td><td>Xray Thorax</td><td>-</td></tr><tr><td>Thorax Pain </td><td>Xray Thorax</td><td>-</td></tr><tr><td>Pectus Pathology </td><td>MRI</td><td>CT</td></tr><tr><td>Trauma </td><td>Xray Thorax + Rib Detail</td><td>CT</td></tr><tr><td>Tumor Staging </td><td>CT - Thorax Abdomen</td><td>CT</td></tr></tbody></table></div>',
        Abdomen: '<h3 class="text-center">Abdomen</h3><style>ul.tab {list-style-type: none;margin: 0;padding: 0;overflow: hidden;border: 1px solid #004080;background-color: #f1f1f1;}ul.tab li {float: left;}ul.tab li a {display: inline-block;text-align: center;padding: 14px 16px;text-decoration: none;transition: 0.3s;font-size: 17px;}ul.tab li a:hover {background-color: #004080;color: white;}ul.tab li a:focus, .active {background-color: #004080;color: white;}.tabcontent {display: none;padding: 6px 12px;border: 1px solid #004080;border-top: none;}</style><ul class="tab"><li><a class="tablinks active" onclick="openCity(event, \'General\')">General</a></li><li><a class="tablinks" onclick="openCity(event, \'Urology\')">Urology</a></li></ul><div id="General" class="tabcontent" style="display:block"><h3>General</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Abscess</td><td>CT</td><td>-</td></tr><tr><td>Acute Aneurysm Aortae Abdominal (AAA)</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Aortic Dissection</td><td>CT</td><td>-</td></tr><tr><td>Apendix Pathology</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Ascites</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Incarcerated Epigastric Herniation</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Adrenal Mass</td><td>MRI</td><td>CT</td></tr><tr><td>Biloma</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Cholangitis</td><td>Ultrasound</td><td>MRCP/ERCP</td></tr><tr><td>Cholecystolithiases</td><td>X Abdominal View</td><td>ERCP</td></tr><tr><td>Cholestatic Liver Disease</td><td>Ultrasound</td><td>MRCP/ERCP</td></tr><tr><td>Diverticulitis</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Drainage (Abscess)</td><td>CT</td><td>-</td></tr><tr><td>Fistel</td><td>Fistulogram and Xray Abdomen</td><td>MRI</td></tr><tr><td>Follow up AAA</td><td>Ultrasound</td><td>-</td></tr><tr><td>Hematoma</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Hepatomegaly</td><td>Ultrasound</td><td>-</td></tr><tr><td>Inguinal Hernia/Femoral Hernia</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Umbilical Hernia</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Spigelian Hernia</td><td>Ultrasound</td><td>-</td></tr><tr><td>Ileus</td><td>X Abdominal View</td><td>CT</td></tr><tr><td>Infiltrate</td><td>CT</td><td>-</td></tr><tr><td>Liver Cirrhosis</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Liver Hematoma or Larceration</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Liver Metastases - Initial Work Up</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Liver Metastases - Follow Up</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Liver Tumor</td><td>CT</td><td>MRI</td></tr><tr><td>Lymphomas</td><td>CT</td><td>-</td></tr><tr><td>Spleen Metastases</td><td>CT</td><td>-</td></tr><tr><td>Spleen Hematoma or Larceration</td><td>CT</td><td>Ultrasound</td></tr><tr><td>Further Tumor Analysis</td><td>CT</td><td>-</td></tr><tr><td>Pancreatitis</td><td>CT</td><td>-</td></tr><tr><td>Pancreas Tumor</td><td>CT</td><td>-</td></tr><tr><td>Psoas Hematoma</td><td>CT</td><td>-</td></tr><tr><td>Punction Biopsy</td><td>CT</td><td>Ultrasound</td></tr><tr><td>Rectus Abdominis Hematoma</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Screening Abdomen Pathology</td><td>Ultrasound and Xray BOZ</td><td>CT</td></tr><tr><td>Splenomegaly</td><td>Ultrasound</td><td>-</td></tr><tr><td>Abdominal Trauma</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Abdominal Trauma - Kids</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Tumor</td><td>CT</td><td>-</td></tr></tbody></table></div></div><div id="Urology" class="tabcontent"><h3>Urology</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Barrier Discharge</td><td>Ultrasound</td><td>-</td></tr><tr><td>Pelvic Kidney</td><td>Ultrasound</td><td>-</td></tr><tr><td>Bladder Tumor</td><td>Ultrasound and cystoscopy</td><td>CT</td></tr><tr><td>Bladder Concrement</td><td>Ultrasound and Xray BOZ</td><td>-</td></tr><tr><td>Hematoma after Urology Surgery</td><td>CT</td><td>-</td></tr><tr><td>Haematuria</td><td>CT - IVP</td><td>-</td></tr><tr><td>Hydronephrosis</td><td>Ultrasound</td><td>-</td></tr><tr><td>Leakage after Radical Prostatectomy</td><td>Retrograde Urethrography</td><td>-</td></tr><tr><td>Further Analysis Pyelum</td><td>Retrograde Urethrography</td><td>-</td></tr><tr><td>Kidney Stone</td><td>CT</td><td>-</td></tr><tr><td>Kidney Cysts</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Kidney Hematoma, Larceration, Trauma</td><td>CT</td><td>-</td></tr><tr><td>Kidney Tumor</td><td>CT</td><td>Ultrasound</td></tr><tr><td>Prostaathypertrophie</td><td>Endoanal Ultrasound</td><td>-</td></tr><tr><td>Reflux</td><td>MCUG</td><td>-</td></tr><tr><td>Renal Hypertension</td><td>MRI Angiography</td><td>-</td></tr><tr><td>Retroperitoneal Fibrosis</td><td>CT</td><td>-</td></tr><tr><td>Screening Urological Pathology</td><td>Ultrasound and Xray BOZ</td><td>-</td></tr><tr><td>Ureter Concrement</td><td>CT</td><td>IVP</td></tr><tr><td>Urachal Cyst</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Urachal Fistula</td><td>Fistulagram</td><td>-</td></tr><tr><td>Ureter Pathology</td><td>CT Urography</td><td>-</td></tr><tr><td>Urethal Malignancy</td><td>MRI</td><td>-</td></tr></tbody></table></div></div><script>function openCity(evt, cityName) {var i, tabcontent, tablinks;tabcontent = document.getElementsByClassName("tabcontent");for (i = 0; i < tabcontent.length; i++) {tabcontent[i].style.display = "none";}tablinks = document.getElementsByClassName("tablinks");for (i = 0; i < tablinks.length; i++) {tablinks[i].className = tablinks[i].className.replace(" active", "");}document.getElementById(cityName).style.display = "block";evt.currentTarget.className += " active";}</script>',
        Genetalia: '<h3 class="text-center">Genitalia</h3><style>ul.tab {list-style-type: none;margin: 0;padding: 0;overflow: hidden;border: 1px solid #004080;background-color: #f1f1f1;}ul.tab li {float: left;}ul.tab li a {display: inline-block;text-align: center;padding: 14px 16px;text-decoration: none;transition: 0.3s;font-size: 17px;}ul.tab li a:hover {background-color: #004080;color: white;}ul.tab li a:focus, .active {background-color: #004080;color: white;}.tabcontent {display: none;padding: 6px 12px;border: 1px solid #004080;border-top: none;}</style><ul class="tab"><li><a class="tablinks active" onclick="openCity(event, \'Men\')">Men</a></li><li><a class="tablinks" onclick="openCity(event, \'Women\')">Women</a></li></ul><div id="Men" class="tabcontent" style="display:block"><h3>Men</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Cryptorchidism</td><td>Ultrasound</td><td>-</td></tr><tr><td>Epididymitis</td><td>Ultrasound (Doppler)</td><td>-</td></tr><tr><td>Hematoma</td><td>Ultrasound</td><td>-</td></tr><tr><td>Hydrocele</td><td>Ultrasound</td><td>-</td></tr><tr><td>Orchitis</td><td>Ultrasound (Doppler)</td><td>-</td></tr><tr><td>Prostate Deformation</td><td>Endo Anal Ultrasound</td><td>-</td></tr><tr><td>Spermatic Cysts</td><td>Ultrasound</td><td>-</td></tr><tr><td>Testical Tumor</td><td>Ultrasound</td><td>-</td></tr><tr><td>Testicular Torsion</td><td>Ultrasound (Doppler)</td><td>-</td></tr><tr><td>Trauma</td><td>Ultrasound</td><td>-</td></tr><tr><td>Urethra</td><td>Retrograde Urethrography</td><td>MCUG</td></tr><tr><td>Varicocèle</td><td>Ultrasound</td><td>-</td></tr></tbody></table></div></div><div id="Women" class="tabcontent"><h3>Women</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Adnexal Cyst</td><td>Transabdomen Ultrasound</td><td>Transvaginal Ultrasound</td></tr><tr><td>Cervix Tumor</td><td>MRI</td><td>CT</td></tr><tr><td>Endometriosis</td><td>Via Gynaecologist</td><td>MRI</td></tr><tr><td>Tubal Pregnancy</td><td>Transvaginal Ultrasound</td><td>-</td></tr><tr><td>IUD Lost</td><td>Xray Pelvic</td><td>Ultrasound</td></tr><tr><td>Lower Abdomen Compliants - Screening</td><td>Ultrasound</td><td>-</td></tr><tr><td>Ovary Tumor</td><td>Ultrasound</td><td>CT</td></tr><tr><td>PID - Pelvic Inflammatory Disease</td><td>CT</td><td>-</td></tr><tr><td>Pelvimetry</td><td>MRI</td><td>Xray</td></tr><tr><td>Stress Incontinence</td><td>MCUG</td><td>-</td></tr><tr><td>Subfertility (Primary or Secondary)</td><td>HSG</td><td>Lab Hysteroscopy</td></tr><tr><td>Uterus Myoma</td><td>Ultrasound</td><td>MRI/Transvaginal Ultrasound</td></tr><tr><td>Pregnancy Evaluation</td><td>Transvaginal Ultrasound</td><td>Transabdomen Ultrasound</td></tr></tbody></table></div></div><script>function openCity(evt, cityName) {var i, tabcontent, tablinks;tabcontent = document.getElementsByClassName("tabcontent");for (i = 0; i < tabcontent.length; i++) {tabcontent[i].style.display = "none";}tablinks = document.getElementsByClassName("tablinks");for (i = 0; i < tablinks.length; i++) {tablinks[i].className = tablinks[i].className.replace(" active", "");}document.getElementById(cityName).style.display = "block";evt.currentTarget.className += " active";}</script>',
        O: '<h3 class="text-center">Oesophagus</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Pharyngeal Pouches</td><td>Xray Oesophagus</td><td>Scopy</td></tr><tr><td>Diaphragmatic Hernia</td><td>Scopy</td><td>-</td></tr><tr><td>Malignancy</td><td>Scopy</td><td>-</td></tr><tr><td>Oesophagitis</td><td>Scopy</td><td>-</td></tr><tr><td>Status after Surgery</td><td>Xray Oesophagus with Omnipaque</td><td>-</td></tr></tbody></table></div>',
        S: '<h3 class="text-center">Stomach</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Malignancy</td><td>Scopy</td><td>-</td></tr><tr><td>Status after Surgery</td><td>Xray Oesophagus with omnipaque</td><td>-</td></tr><tr><td>Ulcer/Gastritis</td><td>Scopy</td><td>-</td></tr></tbody></table></div>',
        SI: '<h3 class="text-center">Small Intestine</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Coeliac Disease</td><td>MRI</td><td>Scopy</td></tr><tr><td>Crohn</td><td>MRI</td><td>DDP</td></tr><tr><td>Meckels diverticulum</td><td>Isotope Scan</td><td>-</td></tr><tr><td>Stenosis</td><td>MRI</td><td>DDP</td></tr></tbody></table></div>',
        C: '<h3 class="text-center">Colon</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>RIP</td><td>Scopy</td><td>Xray Colon</td></tr><tr><td>Colitis</td><td>Scopy</td><td>-</td></tr><tr><td>Defecation Problem</td><td>Defecography</td><td>-</td></tr><tr><td>Diverticulitis</td><td>Ultrasound</td><td>CT</td></tr><tr><td>Diverticulum</td><td>Xray Colon-scopy</td><td>Xray Colon</td></tr><tr><td>Colon Polyps</td><td>Scopy</td><td>-</td></tr><tr><td>Post Operative Leakage</td><td>Xray Oesophagus with Omnipaque</td><td>CT + Rectal or Oral Omnipaque</td></tr><tr><td>Stenosis</td><td>Xray Colon</td><td>Scopy</td></tr></tbody></table></div>',
        Spine: '<h3 class="text-center">Spine</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Abscess peri-/epidural</td><td>MRI</td><td>-</td></tr><tr><td>Bleeding or nerve/ spinal cord compression after trauma</td><td>MRI</td><td>-</td></tr><tr><td>Cauda equina syndrome </td><td>MRI</td><td>-</td></tr><tr><td>Fracture</td><td>Spinal Xray</td><td>CT and MPR</td></tr><tr><td>Fracture- further analysis type and stability</td><td>CT</td><td>MRI</td></tr><tr><td>Cervical ribs</td><td>X Cervical Spine AP</td><td>-</td></tr><tr><td>Herniated disc</td><td>MRI</td><td>CT</td></tr><tr><td>Infection general</td><td>MRI</td><td>CT</td></tr><tr><td>Spinal stenosis</td><td>MRI</td><td>CT</td></tr><tr><td>Scar tissue following herniated disc operation</td><td>MRI</td><td>-</td></tr><tr><td>Metastases peri/epidural</td><td>MRI</td><td>-</td></tr><tr><td>Metastases vertrebral</td><td>MRI</td><td>Isotope Scan</td></tr><tr><td>Myeloma pathology</td><td>MRI</td><td>-</td></tr><tr><td>Osseus pathology</td><td>X Spine</td><td>CT</td></tr><tr><td>Scheuermann disease</td><td>X Thoracal Spine</td><td>-</td></tr><tr><td>Scoliosis</td><td>Spinal Xray</td><td>-</td></tr><tr><td>Screening</td><td>Cervical, Thoracal or Lumbal Spine</td><td>-</td></tr><tr><td>Spondylitis</td><td>MRI</td><td>CT</td></tr><tr><td>Spondylodiscitis</td><td>MRI</td><td>-</td></tr><tr><td>Tumor</td><td>MRI</td><td>CT</td></tr></tbody></table></div>',
        Shoulder: '<h3 class="text-center">Shoulder</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Arthritis</td><td>Xray shoulder</td><td>Ultrasound</td></tr><tr><td>Arthosis</td><td>Xray shoulder</td><td>CT</td></tr><tr><td>Bursitis</td><td>Xray shoulder</td><td>MRI</td></tr><tr><td>Congenital malformation   </td><td>Xray shoulder</td><td>CT</td></tr><tr><td>Foreign body/corpus alienum</td><td>Xray shoulder</td><td>-</td></tr><tr><td>Joint mouse</td><td>Xray shoulder</td><td>CT</td></tr><tr><td>Rotator cuff pathology</td><td>MRI</td><td>Ultrasound</td></tr><tr><td>Fracture further analysis</td><td>CT</td><td>-</td></tr><tr><td>Frozen shoulder</td><td>Xray shoulder</td><td>MRI</td></tr><tr><td>Impingement</td><td>MRI</td><td>-</td></tr><tr><td>Infection</td><td>Xray shoulder</td><td>CT</td></tr><tr><td>Cartilage defects</td><td>MRI arthrography</td><td>Arthro CT</td></tr><tr><td>Labral pathology</td><td>MRI arthrography</td><td>Arthro CT</td></tr><tr><td>Shoulder dislocation</td><td>Xray shoulder</td><td>-</td></tr><tr><td>Painful arc</td><td>Xray shoulder</td><td>-</td></tr><tr><td>Synovial pathology</td><td>MRI</td><td>Arthro CT</td></tr></tbody></table></div>',
        Elbow: '<h3 class="text-center">Elbow</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Arthritis</td><td>Xray</td><td>MRI</td></tr><tr><td>Arthosis</td><td>Xray</td><td>-</td></tr><tr><td>Joint mouse</td><td>Xray</td><td>CT</td></tr><tr><td>Infection</td><td>Xray</td><td>MRI</td></tr><tr><td>Cartilage pathology</td><td>MRI</td><td>-</td></tr><tr><td>Trauma</td><td>Xray</td><td>CT</td></tr><tr><td>Tumor</td><td>Xray</td><td>CT/MRI</td></tr></tbody></table></div>',
        Wrist: '<h3 class="text-center">Wrists</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Arthritis</td><td>Xray wrist</td><td>-</td></tr><tr><td>Arthosis</td><td>Xray wrist</td><td>Nucleur Medicine Scan</td></tr><tr><td>Carpal ligament instability</td><td>CT - Angiography</td><td>-</td></tr><tr><td>Congenital malformation   </td><td>Xray wrist</td><td>CT</td></tr><tr><td>Ganglion cyst</td><td>Ultrasound</td><td>MRI</td></tr><tr><td>Infection</td><td>Xray wrist</td><td>MRI</td></tr><tr><td>Triangular fibrocartilage complex (TFCC)</td><td>MRI</td><td>-</td></tr><tr><td>Pseudoarthrosis</td><td>CT</td><td>-</td></tr><tr><td>Trauma</td><td>Xray wrist</td><td>CT</td></tr><tr><td>Tumor</td><td>Xray wrist</td><td>CT/MRI</td></tr></tbody></table></div>',
        Hip: '<h3 class="text-center">Pelvis and Hips</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Arthritis</td><td>Xray pelvic</td><td>MRI</td></tr><tr><td>Arthosis</td><td>Xray pelvic</td><td>-</td></tr><tr><td>Pelvic fracture further analysis</td><td>Xray pelvic</td><td>CT</td></tr><tr><td>Congenital malformation   </td><td>Xray pelvic</td><td>CT</td></tr><tr><td>Suspicious hip fracture</td><td>CT</td><td>MRI</td></tr><tr><td>Femur head necrosis</td><td>MRI</td><td>-</td></tr><tr><td>Infection</td><td>Xray pelvic</td><td>MRI</td></tr><tr><td>Metastases</td><td>Xray pelvic</td><td>MRI</td></tr><tr><td>Sacroiliitis</td><td>Xray pelvic</td><td>CT/MRI</td></tr><tr><td>Symphysiolysis</td><td>Xray pelvic</td><td>-</td></tr><tr><td>Transient osteoporosis</td><td>MRI</td><td>-</td></tr><tr><td>Trauma</td><td>Xray pelvic</td><td>CT</td></tr><tr><td>Tumor</td><td>Xray pelvic</td><td>CT + MRI</td></tr></tbody></table></div>',
        Knee: '<h3 class="text-center">Knees</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Acute trauma met hydrops</td><td>Xray Knee</td><td>MRI</td></tr><tr><td>Arthritis</td><td>Xray Knee</td><td>MRI</td></tr><tr><td>Arthosis</td><td>Xray Knee</td><td>-</td></tr><tr><td>Baker’s cyst </td><td>Ultrasound</td><td>MRI</td></tr><tr><td>Foreign body/corpus alienum</td><td>Xray Knee</td><td>-</td></tr><tr><td>Joint mouse</td><td>Xray Knee</td><td>CT</td></tr><tr><td>Fracture further analysis</td><td>CT</td><td>-</td></tr><tr><td>Infection</td><td>Xray Knee</td><td>MRI</td></tr><tr><td>Cartilage pathology</td><td>MRI</td><td>-</td></tr><tr><td>Cruciate ligament or collateral ligament pathology</td><td>MRI</td><td>-</td></tr><tr><td>Meniscal Cyst</td><td>MRI</td><td>-</td></tr><tr><td>Meniscal tear</td><td>MRI</td><td>-</td></tr><tr><td>Osgood Schlatter </td><td>Xray Knee</td><td>-</td></tr><tr><td>Osteochondritis dissecans</td><td>Xray Knee</td><td>MRI</td></tr><tr><td>Osteonecrosis</td><td>MRI</td><td>-</td></tr><tr><td>Osteochondral defect</td><td>MRI</td><td>-</td></tr><tr><td>Retropatellar chondropathy</td><td>MRI</td><td>-</td></tr><tr><td>Patellar tendon rupture</td><td>MRI</td><td>-</td></tr><tr><td>Trauma</td><td>Xray Knee</td><td>CT</td></tr><tr><td>Tumor</td><td>Xray Knee</td><td>CT + MRI</td></tr><tr><td>Vacular</td><td>Ultrasound</td><td>MRI</td></tr></tbody></table></div>',
        Ankle: '<h3 class="text-center">Ankles</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Achilles Tendon Pathology</td><td>Ultrasound</td><td>MRI</td></tr><tr><td>Arthritis</td><td>Xray</td><td>MRI</td></tr><tr><td>Arthosis</td><td>Xray</td><td>-</td></tr><tr><td>Injury of the Ankle Ligaments</td><td>MRI</td><td>-</td></tr><tr><td>Congenital malformation</td><td>Xray</td><td>CT</td></tr><tr><td>Fracture Further Analysis</td><td>CT</td><td>-</td></tr><tr><td>Infection</td><td>Xray</td><td>-</td></tr><tr><td>Cartilage Pathology</td><td>MRI</td><td>-</td></tr><tr><td>Osteochondritis dissecans (talus)</td><td>Xray</td><td>MRI</td></tr><tr><td>Trauma</td><td>Xray</td><td>CT</td></tr><tr><td>Tumor</td><td>Xray</td><td>MRI</td></tr></tbody></table></div>',
    };

    var $bone_map, $body_map, $organ_map, bone_default_options, body_default_options, organ_default_options;

    $bone_map = $('#skeleton_image');
    $body_map = $('#body_image');
    $organ_map = $('#organ_image');

    function boneBuildAreas() {
        var items = $('#boneMap').find('area');
        var areaArray = [];

        items.each(function () {

            var fullName = $(this).attr('bone');
            areaArray.push({ key: fullName, toolTip: buildToolTipArea(fullName), highlight: true });
        });
        return areaArray;
    }

    function bodyBuildAreas() {
        var items = $('#bodyMap').find('area');
        var areaArray = [];

        items.each(function () {

            var fullName = $(this).attr('part');
            if(fullName==="Thorax"){
              areaArray.push({ key: fullName, toolTip: buildToolTipArea(fullName), highlight: true, selected: true });
            }
            else{
              areaArray.push({ key: fullName, toolTip: buildToolTipArea(fullName), highlight: true });
            }
        });
        return areaArray;
    }

    function organBuildAreas() {
        var items = $('#organMap').find('area');
        var areaArray = [];

        items.each(function () {

            var fullName = $(this).attr('organ');
            var k = $(this).attr('key');
            if(fullName==="Stomach"){
              areaArray.push({ key: k, toolTip: buildToolTipArea(fullName), highlight: true, selected: true });
            }
            else{
              areaArray.push({ key: k, toolTip: buildToolTipArea(fullName), highlight: true });
            }
        });
        return areaArray;
    }

    function buildToolTipArea(fullName) {
        return $('<div><b>' + fullName + '</b></div>');
    }

    bone_default_options =
        {
            fillOpacity: 0.5,
            render_highlight: {
                fillColor: 'ff000c',
            },
            render_select: {
                fillColor: '22ff00',
                stroke: false
            },
            fadeInterval: 50,
            isSelectable: true,
            singleSelect: true,
            mapKey: 'bone',
            showToolTip: true,
            toolTipClose: ['area-mouseout', 'tooltip-click', 'area-click'],
            areas: boneBuildAreas(),
            onClick: function (e) {
              if(e.selected) {
                $('#selections').html(data[e.key]);
              }
              else {
                $('#selections').html('');
              }
            }
        };

    body_default_options =
        {
            fillOpacity: 0.5,
            render_highlight: {
                fillColor: '22ff00',
                strokeWidth: 2,
                stroke:true,
                strokeColor: '22ff00'
            },
            render_select: {
                fillColor: 'ff000c',
                strokeWidth: 0,
                stroke:true,
                strokeColor: 'ff000c'
            },

            fadeInterval: 50,
            isSelectable: true,
            singleSelect: true,
            mapKey: 'part',
            showToolTip: true,
            toolTipClose: ['area-mouseout', 'tooltip-click', 'area-click'],
            areas: bodyBuildAreas(),
            onClick: function (e) {
              if(e.selected) {
                $('#selections').html(data[e.key]);
              }
              else {
                $('#selections').html('');
              }
            }
        };

    organ_default_options =
        {
            fillOpacity: 0.5,
            render_highlight: {
                fillColor: '0000ff',
            },
            render_select: {
                fillColor: 'ff000c',
                stroke: false
            },
            fadeInterval: 50,
            isSelectable: true,
            singleSelect: true,
            mapKey: 'key',
            showToolTip: true,
            toolTipClose: ['area-mouseout', 'tooltip-click', 'area-click'],
            areas: organBuildAreas(),
            onClick: function (e) {
              if(e.selected) {
                $('#selections').html(data[e.key]);
              }
              else {
                $('#selections').html('');
              }
            }
        };

    $bone_map.mapster(bone_default_options);
    $body_map.mapster(body_default_options);
    $organ_map.mapster(organ_default_options);

});
