define(['questAPI'], function(Quest){
    var API = new Quest();

	API.addQuestionsSet('basicSelect', 
	{
		type: 'selectOne',
		autoSubmit:true,
		numericValues:true, 
		required : true, 		
		errorMsg: {
			required: 
			"Please select an answer, or click 'Decline to Answer'"
		},
		helpText: 'Selecting an answer once colors it blue.<br/>You can change your answer by selecting another option.<br/>To confirm, click the selected (blue) button a second time.'   
	});
    
API.addPagesSet('qPage', 
	{
		progressBar: '<br><%= pagesMeta.number %> out of 6',
        
		decline:true,
		v1style:2,
		numbered: false
	});

    API.addSequence([
  
   {mixer:'random', 
    data:[
             

       {inherit:'qPage',
            questions:[{inherit : {set:'basicSelect'},
            name: 'explicit1',
        	stem: '<b>Which statement best describes your feelings towards Asian and Black people?</b><br><br> ',
        	answers: ['I strongly prefer Asian people to Black people', 'I moderately prefer Asian people to Black people', 'I slightly prefer Asian people to Black people',  'I like Asian people and Black people equally', 'I slightly prefer Black people to Asian people', 'I moderately prefer Black people to Asian people', 'I strongly prefer Black people to Asian people']}]
        },
        {inherit:'qPage',
            questions:[{inherit : {set:'basicSelect'},
            name: 'explicit2',
        	stem: '<b> Which statement best describes your feelings towards Black and White people? </b><br><br> ',
        	answers: ['I strongly prefer Black people to White people','I moderately prefer Black people to White people', 'I slightly prefer Black people to White people', 'I like Black people and White people equally', 'I slightly prefer White people to Black people', 'I moderately prefer White people to Black people', 'I strongly prefer White people to Black people']}]
        },
        {inherit:'qPage',
            questions:[{inherit : {set:'basicSelect'},
            name: 'explicit3',
        	stem: '<b> Which statement best describes your feelings towards Asian and White people? </b><br><br> ',
        	answers: ['I strongly prefer Asian people to White people','I moderately prefer Asian people to White people', 'I slightly prefer Asian people to White people', 'I like Asian people and White people equally', 'I slightly prefer White people to Asian people', 'I moderately prefer White people to Asian people', 'I strongly prefer White people to Asian people']}]
        },
        {inherit:'qPage',
            questions:[{inherit : {set:'basicSelect'},
            name: 'explicit4',
        	stem: '<b> Which statement best describes your feelings towards Hispanic and Asian people?</b><br><br> ',
        	answers: ['I strongly prefer Hispanic people to Asian people','I moderately prefer Hispanic people to Asian people', 'I slightly prefer Hispanic people to Asian people', 'I like Hispanic people and Asian people equally', 'I slightly prefer Asian people to Hispanic people', 'I moderately prefer Asian people to Hispanic people', 'I strongly prefer Asian people to Hispanic people']}]
        },
        {inherit:'qPage',
            questions:[{inherit : {set:'basicSelect'},
            name: 'explicit5',
        	stem: '<b> Which statement best describes your feelings towards Black and Hispanic people? </b><br><br> ',
        	answers: ['I strongly prefer Black people to Hispanic people','I moderately prefer Black people to Hispanic people', 'I slightly prefer Black people to Hispanic people', 'I like Black people and Hispanic people equally', 'I slightly prefer Hispanic people to Black people', 'I moderately prefer Hispanic people to Black people', 'I strongly prefer Hispanic people to Black people']}]
        },
   
        {inherit:'qPage',
            questions:[{inherit : {set:'basicSelect'},
            name: 'explicit6',
        	stem: '<b> Which statement best describes your feelings towards White and Hispanic people? </b><br><br> ',
        	answers: ['I strongly prefer White people to Hispanic people','I moderately prefer White people to Hispanic people', 'I slightly prefer White people to Hispanic people', 'I like White people and Hispanic people equally', 'I slightly prefer Hispanic people to White people', 'I moderately prefer Hispanic people to White people', 'I strongly prefer Hispanic people to White people']}]
        },

 ]}
 

      ])
	
  API.addSettings('DEBUG', {level: 'error'});
	// ### Questions
	// Use variables from the data property to create the name and stem.
	// The idea is that this question will be inherited by many other questions.
	// Those questions will set the name and stem by setting variables into the data property (see example below).
	
		API.addPagesSet('basicPage',{
		noSubmit:false, //Change to true if you don't want to show the submit button.
		v1style: 2,
		decline: true,
		declineText:'Decline to Answer', 
		autoFocus:true, 
		numbered: false,
		progressBar: 'Page <%= pagesMeta.number %> out of 12'
	});
	
		
	
	API.addQuestionsSet('basicQ',{
		decline: true,
		required : false,
		errorMsg: {
			required:
			"Please select an answer, or click 'Decline to Answer'"
		},
		autoSubmit:true,
		numericValues:true
	});
	
		API.addQuestionsSet('singleChoice',{
		inherit: 'basicQ',
		type: 'selectOne', 
		help: '<%= pagesMeta.number < 10 %>',
		helpText: 'Tip: For quick response, click to select your answer, and then click again to submit.'
	});

	API.addQuestionsSet('text',{
			inherit: 'basicQ',
			type: 'text',
			noSubmit:false
	});

	API.addQuestionsSet('singleChoicedrop',{
		inherit: 'basicQ',
		autoSubmit:false,
		type: 'dropdown'
	});

	API.addQuestionsSet('multiChoice',{
		inherit: 'basicQ',
		type: 'selectMulti'
	});

		
		
		API.addQuestionsSet('textNumber',
	{
		type: 'textNumber',
		min:1,
		max:12,
	    inline:true,
		autoSubmit:true,
		numericValues:true,
		required:true,
		errorMsg: {
			required: "Please type an answer, or click 'decline to answer'"
		}
	});
		
		API.addQuestionsSet('textNumber2',
	{
		type: 'textNumber',
		min:0,
		max:100,
	    inline:true,
		autoSubmit:true,
		numericValues:true,
		required:true,
		errorMsg: {
			required: "Please type an answer, or click 'decline to answer'"
		}
	});
	
	// Create questions that inherit basicSelect and set the name of the target person.
	
	API.addQuestionsSet('birthsex',{
		inherit: 'singleChoice',
		name: 'birth_sex',
		stem: "What sex were you assigned at birth, on your original birth certificate?",
		answers: [
			{text:'Male',value:1},
			{text:'Female',value:2}
		]
	});
	
	API.addQuestionsSet('birthyear',{
		inherit: 'singleChoicedrop',
		name: 'birthyear',
		stem: "Please indicate the <u>year</u> of your birth.",
		answers: [
			 {text:'2016',value:2016},
			 {text:'2015',value:2015},
			 {text:'2014',value:2014},
			 {text:'2013',value:2013},
			 {text:'2012',value:2012},
			 {text:'2011',value:2011},
			 {text:'2010',value:2010},
			 {text:'2009',value:2009},
			 {text:'2008',value:2008},
			 {text:'2007',value:2007},
			 {text:'2006',value:2006},
			 {text:'2005',value:2005},
			 {text:'2004',value:2004},
			 {text:'2003',value:2003},
			 {text:'2002',value:2002},
			 {text:'2001',value:2001},
			 {text:'2000',value:2000},
			 {text:'1999',value:1999},
			 {text:'1998',value:1998},
			 {text:'1997',value:1997},
			 {text:'1996',value:1996},
			 {text:'1995',value:1995},
			 {text:'1994',value:1994},
			 {text:'1993',value:1993},
			 {text:'1992',value:1992},
			 {text:'1991',value:1991},
			 {text:'1990',value:1990},
			 {text:'1989',value:1989},
			 {text:'1988',value:1988},
			 {text:'1987',value:1987},
			 {text:'1986',value:1986},
			 {text:'1985',value:1985},
			 {text:'1984',value:1984},
			 {text:'1983',value:1983},
			 {text:'1982',value:1982},
			 {text:'1981',value:1981},
			 {text:'1980',value:1980},
			 {text:'1979',value:1979},
			 {text:'1978',value:1978},
			 {text:'1977',value:1977},
			 {text:'1976',value:1976},
			 {text:'1975',value:1975},
			 {text:'1974',value:1974},
			 {text:'1973',value:1973},
			 {text:'1972',value:1972},
			 {text:'1971',value:1971},
			 {text:'1970',value:1970},
			 {text:'1969',value:1969},
			 {text:'1968',value:1968},
			 {text:'1967',value:1967},
			 {text:'1966',value:1966},
			 {text:'1965',value:1965},
			 {text:'1964',value:1964},
			 {text:'1963',value:1963},
			 {text:'1962',value:1962},
			 {text:'1961',value:1961},
			 {text:'1960',value:1960},
			 {text:'1959',value:1959},
			 {text:'1958',value:1958},
			 {text:'1957',value:1957},
			 {text:'1956',value:1956},
			 {text:'1955',value:1955},
			 {text:'1954',value:1954},
			 {text:'1953',value:1953},
			 {text:'1952',value:1952},
			 {text:'1951',value:1951},
			 {text:'1950',value:1950},
			 {text:'1949',value:1949},
			 {text:'1948',value:1948},
			 {text:'1947',value:1947},
			 {text:'1946',value:1946},
			 {text:'1945',value:1945},
			 {text:'1944',value:1944},
			 {text:'1943',value:1943},
			 {text:'1942',value:1942},
			 {text:'1941',value:1941},
			 {text:'1940',value:1940},
			 {text:'1939',value:1939},
			 {text:'1938',value:1938},
			 {text:'1937',value:1937},
			 {text:'1936',value:1936},
			 {text:'1935',value:1935},
			 {text:'1934',value:1934},
			 {text:'1933',value:1933},
			 {text:'1932',value:1932},
			 {text:'1931',value:1931},
			 {text:'1930',value:1930},
			 {text:'1929',value:1929},
			 {text:'1928',value:1928},
			 {text:'1927',value:1927},
			 {text:'1926',value:1926},
			 {text:'1925',value:1925},
			 {text:'1924',value:1924},
			 {text:'1923',value:1923},
			 {text:'1922',value:1922},
			 {text:'1921',value:1921},
			 {text:'1920',value:1920},
			 {text:'1919',value:1919},
			 {text:'1918',value:1918},
			 {text:'1917',value:1917},
			 {text:'1916',value:1916},
			 {text:'1915',value:1915},
			 {text:'1914',value:1914},
			 {text:'1913',value:1913},
			 {text:'1912',value:1912},
			 {text:'1911',value:1911},
			 {text:'1910',value:1910}
		]
	});
	
		API.addQuestionsSet('birthmonth',{
		inherit: 'singleChoicedrop',
		name: 'birthmonth',
		stem: "Please indicate the <u>month</u> of your birth.",
		answers: [
			{text:'January',value:1},
			{text:'February',value:2}, 
			{text:'March',value:3}, 
			{text:'April',value:4}, 
			{text:'May',value:5},
			{text:'June',value:6},
			{text:'July',value:7},
			{text:'August',value:8},
			{text:'September',value:9},
			{text:'October',value:10},
			{text:'November',value:11}, 
			{text:'December',value:12}

		]
	});

	
		API.addQuestionsSet('raceombmulti',{
		inherit: 'multiChoice',
		name: 'raceombmulti',
        stem: "Please select the categories that comprise your race. (Click a category once to select it. Click it again to deselect. You may select as many categories as you wish. When you are finished, click Submit.)",
        answers: [
			{text:'American Indian/Alaska Native',value:1},
			{text:'East Asian',value:2},
			{text:'South Asian',value:3},
			{text:'Native Hawaiian or other Pacific Islander',value:4},
			{text:'Black or African American',value:5},
			{text:'White',value:6},
			{text:'Other or Unknown',value:7}
		]
	});

	API.addQuestionsSet('ethnicityomb',{
		inherit:'singleChoicedrop',
        name: 'ethnicityomb',
        autoSubmit: false,
        stem: "What is your ethnicity?",
        answers: [
			{text:'Hispanic or Latino',value:1},
			{text:'Not Hispanic or Latino',value:2},
			{text:'Unknown',value:3}
		]
    });


    
    
    	var countriesArray = [
		{text:"U.S.A. ",value:1},
		{text:"Afghanistan",value:2},
		{text:"Albania",value:3},
		{text:"Algeria",value:4},
		{text:"American Samoa",value:5},
		{text:"Andorra",value:6},
		{text:"Angola",value:7},
		{text:"Anguilla",value:8},
		{text:"Antarctica",value:9},
		{text:"Antigua And Barbuda",value:10},
		{text:"Argentina",value:11},
		{text:"Armenia",value:12},
		{text:"Aruba",value:13},
		{text:"Australia",value:14},
		{text:"Austria",value:15},
		{text:"Azerbaijan",value:16},
		{text:"Bahamas, The",value:17},
		{text:"Bahrain",value:18},
		{text:"Bangladesh",value:19},
		{text:"Barbados",value:20},
		{text:"Belarus",value:21},
		{text:"Belgium",value:22},
		{text:"Belize",value:23},
		{text:"Benin",value:24},
		{text:"Bermuda",value:25},
		{text:"Bhutan",value:26},
		{text:"Bolivia",value:27},
		{text:"Bosnia and Herzegovina",value:28},
		{text:"Botswana",value:29},
		{text:"Bouvet Island",value:30},
		{text:"Brazil",value:31},
		{text:"British Indian Ocean Territory",value:32},
		{text:"Brunei",value:33},
		{text:"Bulgaria",value:34},
		{text:"Burkina Faso",value:35},
		{text:"Burundi",value:36},
		{text:"Cambodia",value:37},
		{text:"Cameroon",value:38},
		{text:"Canada",value:39},
		{text:"Cape Verde",value:40},
		{text:"Cayman Islands",value:41},
		{text:"Central African Republic",value:42},
		{text:"Chad",value:43},
		{text:"Chile",value:44},
		{text:"China",value:45},
		{text:"Christmas Island",value:46},
		{text:"Cocos (Keeling) Islands",value:47},
		{text:"Colombia",value:48},
		{text:"Comoros",value:49},
		{text:"Congo",value:50},
		{text:"Congo, Democractic Republic of the",value:51},
		{text:"Cook Islands",value:52},
		{text:"Costa Rica",value:53},
		{text:"Cote D'Ivoire (Ivory Coast)",value:54},
		{text:"Croatia (Hrvatska)",value:55},
		{text:"Cuba",value:56},
		{text:"Cyprus",value:57},
		{text:"Czech Republic",value:58},
		{text:"Denmark",value:59},
		{text:"Djibouti",value:60},
		{text:"Dominica",value:61},
		{text:"Dominican Republic",value:62},
		{text:"East Timor",value:63},
		{text:"Ecuador",value:64},
		{text:"Egypt",value:65},
		{text:"El Salvador",value:66},
		{text:"Equatorial Guinea",value:67},
		{text:"Eritrea",value:68},
		{text:"Estonia",value:69},
		{text:"Ethiopia",value:70},
		{text:"Falkland Islands (Islas Malvinas)",value:71},
		{text:"Faroe Islands",value:72},
		{text:"Fiji Islands",value:73},
		{text:"Finland",value:74},
		{text:"France",value:75},
		{text:"French Guiana",value:76},
		{text:"French Polynesia",value:77},
		{text:"French Southern Territories",value:78},
		{text:"Gabon",value:79},
		{text:"Gambia, The",value:80},
		{text:"Georgia",value:81},
		{text:"Germany",value:82},
		{text:"Ghana",value:83},
		{text:"Gibraltar",value:84},
		{text:"Greece",value:85},
		{text:"Greenland",value:86},
		{text:"Grenada",value:87},
		{text:"Guadeloupe",value:88},
		{text:"Guam",value:89},
		{text:"Guatemala",value:90},
		{text:"Guinea",value:91},
		{text:"Guinea-Bissau",value:92},
		{text:"Guyana",value:93},
		{text:"Haiti",value:94},
		{text:"Heard and McDonald Islands",value:95},
		{text:"Honduras ",value:96},
		{text:"Hong Kong S.A.R. ",value:97},
		{text:"Hungary ",value:98},
		{text:"Iceland ",value:99},
		{text:"India ",value:100},
		{text:"Indonesia ",value:101},
		{text:"Iran ",value:102},
		{text:"Iraq ",value:103},
		{text:"Ireland ",value:104},
		{text:"Israel ",value:105},
		{text:"Italy ",value:106},
		{text:"Jamaica ",value:107},
		{text:"Japan ",value:108},
		{text:"Jordan ",value:109},
		{text:"Kazakhstan ",value:110},
		{text:"Kenya ",value:111},
		{text:"Kiribati ",value:112},
		{text:"Korea ",value:113},
		{text:"Korea, North",value:114},
		{text:"Kuwait ",value:115},
		{text:"Kyrgyzstan ",value:116},
		{text:"Laos ",value:117},
		{text:"Latvia ",value:118},
		{text:"Lebanon ",value:119},
		{text:"Lesotho ",value:120},
		{text:"Liberia ",value:121},
		{text:"Libya ",value:122},
		{text:"Liechtenstein ",value:123},
		{text:"Lithuania ",value:124},
		{text:"Luxembourg ",value:125},
		{text:"Macau S.A.R. ",value:126},
		{text:"Macedonia, Former Yugoslav Republic of ",value:127},
		{text:"Madagascar ",value:128},
		{text:"Malawi ",value:129},
		{text:"Malaysia ",value:130},
		{text:"Maldives ",value:131},
		{text:"Mali ",value:132},
		{text:"Malta ",value:133},
		{text:"Marshall Islands ",value:134},
		{text:"Martinique ",value:135},
		{text:"Mauritania ",value:136},
		{text:"Mauritius ",value:137},
		{text:"Mayotte ",value:138},
		{text:"Mexico ",value:139},
		{text:"Micronesia ",value:140},
		{text:"Moldova ",value:141},
		{text:"Monaco ",value:142},
		{text:"Mongolia ",value:143},
		{text:"Montenegro",value:144},
		{text:"Montserrat ",value:145},
		{text:"Morocco ",value:146},
		{text:"Mozambique ",value:147},
		{text:"Myanmar ",value:148},
		{text:"Namibia ",value:149},
		{text:"Nauru ",value:150},
		{text:"Nepal ",value:151},
		{text:"Netherlands Antilles ",value:152},
		{text:"The Netherlands",value:153},
		{text:"New Caledonia ",value:154},
		{text:"New Zealand ",value:155},
		{text:"Nicaragua ",value:156},
		{text:"Niger ",value:157},
		{text:"Nigeria ",value:158},
		{text:"Niue ",value:159},
		{text:"Norfolk Island ",value:160},
		{text:"Northern Mariana Islands ",value:161},
		{text:"Norway ",value:162},
		{text:"Oman ",value:163},
		{text:"Pakistan ",value:164},
		{text:"Palau ",value:165},
		{text:"Panama ",value:166},
		{text:"Papua new Guinea ",value:167},
		{text:"Paraguay ",value:168},
		{text:"Peru ",value:169},
		{text:"Philippines ",value:170},
		{text:"Pitcairn Island ",value:171},
		{text:"Poland ",value:172},
		{text:"Portugal ",value:173},
		{text:"Puerto Rico ",value:174},
		{text:"Qatar ",value:175},
		{text:"Reunion ",value:176},
		{text:"Romania ",value:177},
		{text:"Russia ",value:178},
		{text:"Rwanda ",value:179},
		{text:"Saint Helena ",value:180},
		{text:"Saint Kitts And Nevis ",value:181},
		{text:"Saint Lucia ",value:182},
		{text:"Saint Pierre and Miquelon ",value:183},
		{text:"Saint Vincent And The Grenadines ",value:184},
		{text:"Samoa ",value:185},
		{text:"San Marino ",value:186},
		{text:"Sao Tome and Principe ",value:187},
		{text:"Saudi Arabia ",value:188},
		{text:"Senegal ",value:189},
		{text:"Seychelles ",value:190},
		{text:"Sierra Leone ",value:191},
		{text:"Singapore ",value:192},
		{text:"Slovakia ",value:193},
		{text:"Slovenia ",value:194},
		{text:"Solomon Islands ",value:195},
		{text:"Somalia ",value:196},
		{text:"South Africa ",value:197},
		{text:"South Georgia And The South Sandwich Islands ",value:198},
		{text:"South Sudan",value:199},
		{text:"Spain ",value:200},
		{text:"Sri Lanka ",value:201},
		{text:"Sudan ",value:202},
		{text:"Suriname ",value:203},
		{text:"Svalbard And Jan Mayen Islands ",value:204},
		{text:"Swaziland ",value:205},
		{text:"Sweden ",value:206},
		{text:"Switzerland ",value:207},
		{text:"Syria ",value:208},
		{text:"Taiwan ",value:209},
		{text:"Tajikistan ",value:210},
		{text:"Tanzania ",value:211},
		{text:"Thailand ",value:212},
		{text:"Togo ",value:213},
		{text:"Tokelau ",value:214},
		{text:"Tonga ",value:215},
		{text:"Trinidad And Tobago ",value:216},
		{text:"Tunisia ",value:217},
		{text:"Turkey ",value:218},
		{text:"Turkmenistan ",value:219},
		{text:"Turks And Caicos Islands ",value:220},
		{text:"Tuvalu ",value:221},
		{text:"Uganda ",value:222},
		{text:"Ukraine ",value:223},
		{text:"United Arab Emirates ",value:224},
		{text:"United Kingdom ",value:225},
		{text:"U.S.A. ",value:1},
		{text:"United States Minor Outlying Islands ",value:226},
		{text:"Uruguay ",value:227},
		{text:"Uzbekistan ",value:228},
		{text:"Vanuatu ",value:229},
		{text:"Vatican City State (Holy See) ",value:230},
		{text:"Venezuela ",value:231},
		{text:"Vietnam ",value:232},
		{text:"Virgin Islands (British) ",value:233},
		{text:"Virgin Islands (US) ",value:234},
		{text:"Wallis And Futuna Islands ",value:235},
		{text:"Yemen ",value:236},
		{text:"Yugoslavia ",value:237},
		{text:"Zambia ",value:238},
		{text:"Zimbabwe", value:239}
	];
    
    	API.addQuestionsSet('countrycit',{
		inherit: 'singleChoicedrop',
		name: 'countrycit',
		stem: "Please indicate the country of your <u>primary citizenship</u>.",
		answers: countriesArray
	});
		
		API.addQuestionsSet('countryres',{
		inherit: 'singleChoicedrop',
		name: 'countryres',
		stem: "Please indicate the country of your <u>residence</u>.",
		answers: countriesArray
	});
		
		API.addQuestionsSet('zipcode',{
		type: 'textnumber',
		name: 'zipcode',
		stem: "Please indicate the <u>postal code</u> of your residence.",
		min: 0,
        max: 99999
	});
		

	API.addQuestionsSet('edu',{
		inherit: 'singleChoicedrop',
		name: 'edu',
		stem: "Please indicate the highest level of education that you have completed.",
		answers: [
			{text:'Elementary school',value:1},
			{text:'Junior school',value:2},
			{text:'Some High school',value:3},
			 {text:'High school graduate',value:4},
			 {text:'Some college',value:5},
			 {text:'Associate\'s degree',value:6},
			 {text:'Bachelor\'s degree',value:7},
			 {text:'Some graduate school',value:8},
			 {text:'Master\'s degree',value:9},
			 {text:'M.B.A.',value:10},
			 {text:'J.D.',value:11},
			 {text:'M.D.',value:12},
			 {text:'Ph.D.',value:13},
			 {text:'Other advanced degree', value:14}
		]
	});
	
	API.addQuestionsSet('fieldofstudy',{
		inherit: 'singleChoicedrop',
		name: 'fieldofstudy',
		stem: "Please indicate the <u>major field of study</u> for your most advanced degree.",
		answers: [
			 {text:'Biological Sciences/Life Sciences',value:1},
			 {text:'Business',value:2},
			 {text:'Communications',value:3},
			 {text:'Computer and Information Sciences',value:4},
			 {text:'Education',value:5},
			 {text:'Engineering',value:6},
			 {text:'Mathematics, Physical Sciences/Technologies',value:7},
			 {text:'Health Professions or Related Sciences',value:8},
			 {text:'Humanities/Liberal Arts',value:9},
			 {text:'Law or Legal Studies',value:10},
			 {text:'Psychology',value:11},
			 {text:'Social Sciences or History',value:12},
			 {text:'Visual or Performing Arts',value:13},
			 {text:'Other', value:14}
		]
	});
	
	var religionArray = [{text:'Judaism - Conservative Jew',value:1},
			 {text:'Judaism - Orthodox Jew',value:2},
			 {text:'Judaism - Reconstructionist Jew',value:3},
			 {text:'Judaism - Reform Jew',value:4},
			 {text:'Judaism - Secular Jew',value:5},
			 {text:'Judaism - Other Jew',value:6},
			 {text:'Catholicism - Roman Catholic',value:7},
			 {text:'Catholicism - Other Catholic',value:8},
			 {text:'Orthodox - Antiochian Orthodox',value:9},
			 {text:'Orthodox - Armenian Orthodox',value:10},
			 {text:'Orthodox - Assyrian Orthodox',value:11},
			 {text:'Orthodox - Coptic Orthodox',value:12},
			 {text:'Orthodox - Eastern Orthodox',value:13},
			 {text:'Orthodox - Greek Orthodox',value:14},
			 {text:'Orthodox - Romanian Orthodox',value:15},
			 {text:'Orthodox - Russian Orthodox',value:16},
			 {text:'Orthodox - Serbian Orthodox',value:17},
			 {text:'Orthodox - Other Orthodox',value:18},
			 {text:'Protestantism - Adventist',value:19},
			 {text:'Protestantism - Anglican/Episcopalian',value:20},
			 {text:'Protestantism - Baptist',value:21},
			 {text:'Protestantism - Brethren',value:22},
			 {text:'Protestantism - Church/Churches of Christ',value:23},
			 {text:'Protestantism - Church of God',value:24},
			 {text:'Protestantism - Congregationalist',value:25},
			 {text:'Protestantism - Methodist/Wesleyan',value:26},
			 {text:'Protestantism - Mormon/Latter Day Saints',value:27},
			 {text:'Protestantism - Lutheran',value:28},
			 {text:'Protestantism - Pentecostal/Charismatic',value:29},
			 {text:'Protestantism - Presbyterian/Reformed',value:30},
			 {text:'Protestantism - Nondenominational',value:31},
			 {text:'Protestantism - Other Protestant',value:32},
			 {text:'Islam - Ahmadi Muslim',value:33},
			 {text:'Islam - Druze Muslim',value:34},
			 {text:'Islam - Sunni Muslim',value:35},
			 {text:'Islam - Shiite Muslim',value:36},
			 {text:'Islam - Other Muslim',value:37},
			 {text:'Buddhism - Sunni Muslim',value:38},
			 {text:'Buddhism - Mahayana Buddhist',value:39},
			 {text:'Buddhism - Theravada Buddhist',value:40},
			 {text:'Buddhism - Vajrayana/Tibetan Buddhist',value:41},
			 {text:'Buddhism - Other Buddhist',value:42},
			 {text:'Far Eastern - Chinese Folk Religion',value:43},
			 {text:'Far Eastern - Confucian',value:44},
			 {text:'Far Eastern - Shinto',value:45},
			 {text:'Far Eastern - Taoist',value:46},
			 {text:'Far Eastern - Tenrikyo',value:47},
			 {text:'Far Eastern - Other Far Eastern',value:48},
			 {text:'Hinduism - Neo-Hindu/Reform Hindu',value:49},
			 {text:'Hinduism - Shaivite Hindu',value:50},
			 {text:'Hinduism - Veerashaiva/Lingayat Hindu',value:51},
			 {text:'Hinduism - Vaishnavite Hindu',value:52},
			 {text:'Hinduism - Shakti Hindu',value:53},
			 {text:'Hinduism - Other Hindu',value:54},
			 {text:'Other Indian - Jain',value:55},
			 {text:'Other Indian - Sikh',value:56},
			 {text:'Other Indian - Other Indian Religion',value:57},
			 {text:'Other Religion - Zoroastrian',value:58},
			 {text:'Other Religion - Baha',value:59},
			 {text:'Other Religion - Indigenous',value:60},
			 {text:'Other Religion - Interfaith',value:61},
			 {text:'Other Religion - Native American',value:62},
			 {text:'Other Religion - Pagan or Neo-Pagan',value:63},
			 {text:'Other Religion - African Tribal Religion',value:64},
			 {text:'Other Religion - Rastafarian',value:65},
			 {text:'Other Religion - Vodoun',value:66},
			 {text:'Other Religion - Scientologist',value:67},
			 {text:'Other Religion - Spiritist',value:68},
			 {text:'Other Religion - Unitarian/Universalist',value:69},
			 {text:'Other Religion - Deist',value:70},
			 {text:'Other Religion - Spiritual',value:71},
			 {text:'Other Religion - Wicca',value:72},
			 {text:'Other Religion - Theist',value:73},
			 {text:'Other Religion - No Organized Religion',value:74},
			 {text:'Non-Religion - Agnostic',value:75},
			 {text:'Non-Religion - Atheist',value:76},
			 {text:'Non-Religion - Other Non-Religion',value:77}
		];
	
		API.addQuestionsSet('religion',{
		inherit: 'singleChoicedrop',
		name: 'religion',
		stem: "Please indicate your  <u>religious affiliation</u>.",
		answers: religionArray
	});
	
		API.addQuestionsSet('religiosity',{
		inherit: 'singleChoice',
		name: 'religiosity',
		stem: "Please indicate the degree of your <u>religiosity</u>.",
		answers: [
			{text:'I am very religious',value:1},
			{text:'I am moderately religious',value:2},
			{text:'I am somewhat religious',value:3},
			{text:'I am not at all religious',value:4}
		]
	});
		
		API.addQuestionsSet('socialpoliticalid',{
		inherit: 'singleChoice',
		name: 'socialpoliticalid',
		stem: "Please indicate your political identity on <u>social issues</u>  (e.g.,  abortion, gun control, gay rights)",
		answers: [
			{text:'I am strongly liberal on social issues',value:1},
			{text:'I am moderately liberal  on social issues',value:2},
			{text:'I am slightly liberal on social issues',value:3},
			{text:'I am in the middle on social issues',value:4},
			{text:'I am slightly conservative on social issues',value:5},
			{text:'I am moderately conservative on social issues',value:6},
			{text:'I am strongly conservative on social issues',value:7}
		]
	});
	
API.addQuestionsSet('econpoliticalid',{
		inherit: 'singleChoice',
		name: 'econpoliticalid',
		stem: "Please indicate your political identity on <u>economic issues</u>  (e.g., taxation, government spending).",
		answers: [
			{text:'I am strongly liberal on economic issues',value:1},
			{text:'I am moderately liberal  on economic issues',value:2},
			{text:'I am slightly liberal on economic issues',value:3},
			{text:'I am in the middle on economic issues',value:4},
			{text:'I am slightly conservative on economic issues',value:5},
			{text:'I am moderately conservative on economic issues',value:6},
			{text:'I am strongly conservative on economic issues',value:7}
		]
	});
	
	API.addSequence([
			{
				inherit: 'basicPage',
				questions: [
					{inherit: 'birthsex', autoSubmit:false},
					{inherit: 'birthyear', autoSubmit:false},
					{inherit: 'birthmonth', autoSubmit:false}
				]
			},
			{
				inherit: 'basicPage',
				questions: [ //If required would be set to true, then participants cannot select one and leave the other empty.
					{inherit:'raceombmulti', required:false},
					{inherit:'ethnicityomb',required:false}
				
				]
				},
				{
				inherit: 'basicPage',
				questions: [
					{inherit: 'countrycit', autoSubmit:false}, 
					{inherit: 'countryres', autoSubmit:false},
					{inherit: 'zipcode', autoSubmit:false}
				]
			},
			{
				inherit: 'basicPage',
				questions: [ //If required would be set to true, then participants cannot select one and leave the other empty.
					{inherit:'edu',  autoSubmit:false},
					{inherit:'fieldofstudy',  autoSubmit:false}
				
				]
				},
				{
				inherit: 'basicPage',
				questions: [ //If required would be set to true, then participants cannot select one and leave the other empty.
					{inherit:'religion',  autoSubmit:false},
					{inherit:'religiosity',  autoSubmit:false}
				
				]
				},
				{
				inherit: 'basicPage',
				questions: [ //If required would be set to true, then participants cannot select one and leave the other empty.
					{inherit:'socialpoliticalid', autoSubmit:false},
					{inherit:'econpoliticalid', autoSubmit:false}
				
				]
				}
			]);
			

	return API.script;
});
		
     



