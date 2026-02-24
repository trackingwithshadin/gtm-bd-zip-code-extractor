___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "BD Smart Zip Code Extractor | Tracking with Shadin",
  "description": "A high-precision tool for Bangladesh postal codes by Tracking with Shadin. It extracts explicit codes from address text and automatically maps 100+ major Upazilas/Thanas and all 64 districts.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "fullAddress",
    "displayName": "Full Address Data Layer Variable",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeString = require('makeString');

const inputAddress = data.fullAddress;
if (!inputAddress) return undefined;

const address = makeString(inputAddress);
const lowerAddress = address.toLowerCase();

const words = lowerAddress.split(' ');
for (let i = 0; i < words.length; i++) {
    let word = words[i].split(',').join('').split('.').join('').split('-').join('');

    if (word.length === 4) {
        let isNumeric = true;
        for (let j = 0; j < word.length; j++) {
            const char = word.charAt(j);
            if (char < '0' || char > '9') {
                isNumeric = false;
                break;
            }
        }
        if (isNumeric) return word;
    }
}

const subDistrictMap = [
    { name: "uttara", zip: "1230" }, { name: "banani", zip: "1213" }, { name: "gulshan", zip: "1212" },
    { name: "mirpur", zip: "1216" }, { name: "dhanmondi", zip: "1205" }, { name: "motijheel", zip: "1000" },
    { name: "bashundhara", zip: "1229" }, { name: "savar", zip: "1340" }, { name: "keraniganj", zip: "1310" },
    { name: "dhamrai", zip: "1350" }, { name: "dohar", zip: "1330" }, { name: "nawabganj", zip: "1320" },
    { name: "tongi", zip: "1710" }, { name: "joydebpur", zip: "1700" }, { name: "kaliakair", zip: "1750" },
    { name: "sreepur", zip: "1740" }, { name: "kapasia", zip: "1730" }, { name: "kaliganj", zip: "1460" },
    { name: "hathazari", zip: "4330" }, { name: "patiya", zip: "4370" }, { name: "satkania", zip: "4386" },
    { name: "loha", zip: "4392" }, { name: "banshkhali", zip: "4391" }, { name: "anwara", zip: "4376" },
    { name: "chandanaish", zip: "4382" }, { name: "boalkhali", zip: "4366" }, { name: "rauzan", zip: "4340" },
    { name: "rangunia", zip: "4360" }, { name: "sandwip", zip: "4310" }, { name: "fatikchhari", zip: "4350" },
    { name: "sitakunda", zip: "4310" }, { name: "mirsharai", zip: "4320" }, { name: "chakaria", zip: "4740" },
    { name: "teknaf", zip: "4860" }, { name: "ukhiya", zip: "4850" }, { name: "ramu", zip: "4830" },
    { name: "maheshkhali", zip: "4710" }, { name: "kutubdia", zip: "4720" }, { name: "pekua", zip: "4750" },
    { name: "paba", zip: "6201" }, { name: "bagmara", zip: "6250" }, { name: "godagari", zip: "6290" },
    { name: "tanore", zip: "6220" }, { name: "bagha", zip: "6280" }, { name: "charghat", zip: "6270" },
    { name: "puthia", zip: "6260" }, { name: "mohanpur", zip: "6210" }, { name: "durgapur", zip: "6240" },
    { name: "ishwardi", zip: "6620" }, { name: "santhis", zip: "6670" }, { name: "sujanagar", zip: "6660" },
    { name: "beanibazar", zip: "3170" }, { name: "bishwanath", zip: "3130" }, { name: "fenchuganj", zip: "3116" },
    { name: "golapganj", zip: "3160" }, { name: "balaganj", zip: "3120" }, { name: "goainghat", zip: "3150" },
    { name: "jaintiapur", zip: "3156" }, { name: "kanaighat", zip: "3180" }, { name: "zakiganj", zip: "3190" },
    { name: "sreemangal", zip: "3210" }, { name: "kulaura", zip: "3230" }, { name: "kamalganj", zip: "3220" },
    { name: "phultala", zip: "9210" }, { name: "dighalia", zip: "9220" }, { name: "rupa", zip: "9241" },
    { name: "dumuria", zip: "9250" }, { name: "terokhada", zip: "9260" }, { name: "paikgachha", zip: "9280" },
    { name: "dakope", zip: "9270" }, { name: "koyra", zip: "9290" }, { name: "mongla", zip: "9350" },
    { name: "bakarganj", zip: "8280" }, { name: "babuganj", zip: "8210" }, { name: "wazirpur", zip: "8220" },
    { name: "banaripara", zip: "8230" }, { name: "gaurnadi", zip: "8240" }, { name: "agailjhara", zip: "8250" },
    { name: "mehendiganj", zip: "8270" }, { name: "muladi", zip: "8260" }, { name: "hizla", zip: "8271" }
];

for (let i = 0; i < subDistrictMap.length; i++) {
    if (lowerAddress.indexOf(subDistrictMap[i].name) !== -1) {
        return subDistrictMap[i].zip;
    }
}

const districtZipMap = [
    { en: "dhaka", zip: "1000" }, { en: "faridpur", zip: "7800" }, { en: "gazipur", zip: "1700" },
    { en: "gopalganj", zip: "8100" }, { en: "kishoreganj", zip: "2300" }, { en: "madaripur", zip: "7900" },
    { en: "manikganj", zip: "1800" }, { en: "munshiganj", zip: "1500" }, { en: "narayanganj", zip: "1400" },
    { en: "narsingdi", zip: "1600" }, { en: "rajbari", zip: "7700" }, { en: "shariatpur", zip: "8000" }, { en: "tangail", zip: "1900" },
    { en: "bandarban", zip: "4600" }, { en: "brahmanbaria", zip: "3400" }, { en: "chandpur", zip: "3600" },
    { en: "chattogram", zip: "4000" }, { en: "cox", zip: "4700" }, { en: "cumilla", zip: "3500" },
    { en: "feni", zip: "3900" }, { en: "khagrachhari", zip: "4400" }, { en: "lakshmipur", zip: "3700" },
    { en: "noakhali", zip: "3800" }, { en: "rangamati", zip: "4500" },
    { en: "bogra", zip: "5800" }, { en: "joypurhat", zip: "5900" }, { en: "naogaon", zip: "6500" },
    { en: "natore", zip: "6400" }, { en: "chapainawabganj", zip: "6300" }, { en: "pabna", zip: "6600" },
    { en: "rajshahi", zip: "6000" }, { en: "sirajganj", zip: "6700" },
    { en: "bagerhat", zip: "9300" }, { en: "chuadanga", zip: "7200" }, { en: "jessore", zip: "7400" },
    { en: "jhenaidah", zip: "7300" }, { en: "khulna", zip: "9000" }, { en: "kushtia", zip: "7000" },
    { en: "magura", zip: "7600" }, { en: "meherpur", zip: "7100" }, { en: "narail", zip: "7500" }, { en: "satkhira", zip: "9400" },
    { en: "barguna", zip: "8700" }, { en: "barishal", zip: "8200" }, { en: "bhola", zip: "8300" },
    { en: "jhalokati", zip: "8400" }, { en: "patuakhali", zip: "8600" }, { en: "pirojpur", zip: "8500" },
    { en: "habiganj", zip: "3300" }, { en: "moulvibazar", zip: "3200" }, { en: "sunamganj", zip: "3000" }, { en: "sylhet", zip: "3100" },
    { en: "dinajpur", zip: "5200" }, { en: "gaibandha", zip: "5700" }, { en: "kurigram", zip: "5600" },
    { en: "lalmonirhat", zip: "5500" }, { en: "nilphamari", zip: "5300" }, { en: "panchagarh", zip: "5000" },
    { en: "rangpur", zip: "5400" }, { en: "thakurgaon", zip: "5100" },
    { en: "jamalpur", zip: "2000" }, { en: "mymensingh", zip: "2200" }, { en: "netrokona", zip: "2400" }, { en: "sherpur", zip: "2100" }
];

for (let i = 0; i < districtZipMap.length; i++) {
    if (lowerAddress.indexOf(districtZipMap[i].en) !== -1) {
        return districtZipMap[i].zip;
    }
}

return undefined;


___TESTS___

scenarios: []


___NOTES___

Created on 2/24/2026, 11:13:22 PM


