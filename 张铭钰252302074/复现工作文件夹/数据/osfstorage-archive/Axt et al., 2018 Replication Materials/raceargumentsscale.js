
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
		progressBar: '<%= pagesMeta.number %> out of 21',
         header: 'Questionnaire',
		decline:true,
		v1style:2,
		numbered: false
	});

    API.addSequence([
    {mixer:'random', // declare the mixer
    data:[
    // 1. This is a page object
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 2a. But only one question
            {
                inherit : {set:'basicSelect'},
                name: 'ra1',
		stem: 'Because the world is a diverse place with many different cultures and people, requiring college students to take courses such as African American studies is a benefit to them. These courses provide students with better understandings of other ethnic groups, cultures, and value systems. This educational experience can enrich students’ lives through cultural awareness. <br/><b/>Conclusion:</b> Courses like African American studies should be required in the education of all college students. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra2',
		stem: 'Articles written about athletes consistently describe White athletes as “intelligent,” “hard-working,” and “crafty” and describe Black athletes as “talented,” “flashy,” and “athletic.” These biased descriptions serve to promote the stereotype that Black athletes are not as intelligent as White athletes and fail to credit Black athletes for their intelligence, discipline, and work ethics. <br/><b/>Conclusion:</b> Biased descriptions of athletes should be avoided to stop perpetuating the stereotype that Black athletes are less intelligent than White athletes. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra3',
		stem: 'The U.S. government is built on a representative democracy that means that politicians are elected to represent their constituents in making the country’s decisions. However, the political construction of power in the United States does not allow adequate representation of Black people, as shown by the few Black politicians who have attained political positions in the highest levels of our government. <br/><b/>Conclusion:</b> The political parties should allow and support the rise of Black politicians within the parties to guarantee fair representation of Black in the government of this country.',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra4',
		stem: 'Sickle cell anemia is a disease that is inherited by many Black children. The disease is potentially fatal, but research to combat the disease has not been as well-funded as research concerning ailments that influence White children as well. The differences in funding are inexcusable, especially since sickle cell anemia is a deadly disease, killing many Black people every year. <br/><b/>Conclusion:</b> Research to combat sickle cell anemia needs to be as well-funded as research for other diseases. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
    }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra5',
		stem: 'Waiting to Exhale and other major motion pictures starring primarily Black casts have been too infrequent in U.S. theaters. Too often, Black actors and actresses have been relegated to minor roles in Hollywood productions, or to roles as villains, and it is about time Black people achieve starring roles. <br/><b/>Conclusion:</b> Black people should be represented in motion pictures in starring roles more frequently than they were in the past. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra6',
		stem: 'Recent educational studies have shown that Black students who do poorly in school may do so because of language difficulties and cultural differences. It has been argued that the use of familiar language and relevant cultural examples in the education of Black children can help to improve the performances that Black children show in school. <br/><b/>Conclusion:</b> School systems should incorporate material into their curricula that is sensitive to Black culture in order to better educate Black children. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    }]},
    {mixer:'random', // declare the mixer
    data:[
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra7',
		stem: 'Experts have argued that SAT scores for Black students may be lower than for White students due to the poorer opportunities available to Black students for education. However, the SAT is a valid predictor of college performance and no concessions should be made for Black students. Lower scores mean poorer performance, and a sliding scale would only promote future failure for Black students with low SAT scores regardless of why they get low SAT scores. <br/><b/>Conclusion:</b> Black students should not be given leniency for low SAT scores in the college admissions process. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra8',
		stem: 'Rodney King was the Black motorist who was beaten by police officers in Los Angeles in an incident captured on video. The incident was broadcast as an unmotivated racial assault on King by the police, but this may not be entirely accurate. King was beaten following a long car chase and resisted arrest upon his capture, and the physical response by the police may have been somewhat warranted. <br/><b/>Conclusion:</b> Rodney King may have at least partially provoked the beating he received from the Los Angeles police officers.',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
	    }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra9',
		stem: 'It has been argued that welfare programs are too often exploited by Black people in this country. Welfare offices in every state appear packed with Black people applying for and collecting welfare benefits. These high numbers of Black welfare recipients are disproportionate for their numbers in the general population and other racial groups are suffering because they cannot receive benefits. <br/><b/>Conclusion:</b> The numbers of Black people receiving welfare should be limited to provide benefits for others. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra10',
		stem: 'President Bill Clinton issued an apology to Black people for the institution of slavery that existed in the United States more than 130 years ago. Clinton’s apology was inappropriate because he and the present government have no connection with the long-abolished practice of slavery and the apology may instead incite current tension in race relations. <br/><b/>Conclusion:</b> President Clinton should not have apologized to Black peoplefor slavery. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra11',
		stem: 'Christians celebrate Christmas, the Jewish celebrate Chanakah, and some Black people celebrate Kwanzaa, a holiday originating from African culture, during the winter holiday season. Many people had never heard about Kwanzaa until recently and suggest that since it appears to be a “new” holiday, it must be a second-tier holiday seeking to emulate Christmas without much inherent significance. <br/><b/>Conclusion:</b> Kwanzaa is not a holiday on the same level of importance as Christmas. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra12',
		stem: 'It has been shown that White Americans score 15 points higher on IQ tests than Black Americans. This difference in IQ scores has even been shown when other variables such as education levels and socioeconomic status are taken into account. <br/><b/>Conclusion:</b> Whites are more intelligent than Black people. ',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ra13',
		stem: 'The United Negro College Fund helps to pay the tuition and expenses that allow Black students to go to college. While no doubt benefiting Black students, this organization is unconstitutionally biased in that it does not offer financial assistance to White students as well. Meanwhile, thousands of White students continue to miss out on furthering their education due to financial limitations.<br/><b/>Conclusion:</b> The United Negro College Fund should be forced, by law, to provide financial resources to both White and Black students',
		answers: ['Not At All', 'Somewhat', 'Moderately', 'Quite A Bit', 'Very Much']
            }
        ]
    }
   
]}
	]);return API.script;
});



