define(['questAPI'], function(Quest){

  var API = new Quest();
  
  /**
   * Page prototype
   */
  API.addPagesSet('basicPage',{
    noSubmit:'false',
    decline: 'false'
  });
  
    /**
   * Question prototypes
   */
  API.addQuestionsSet('basicSelect',{
    type: 'selectOne',
    autoSubmit:'false',
    noSubmit:'true'
  });
  
    API.addQuestionsSet('basicDropdown',{
    type: 'selectOne',
    style: 'multiButtons',
    decline: 'false',
    minWidth: '150px',
    autoSubmit: 'true',
    noSubmit:'true'
  });
   API.addSequence([
    {
      inherit : 'basicPage',
      questions : [{
    type: 'info',
    description: '<font size= "4"><CENTER>Thank you very much for participating in our study! We hope you\'ll have a pleasant experience.</CENTER></font>'
    },
    {
    type: 'info',
    description: '<div><p>Studies at Project Implicit examine your attitudes, preferences and beliefs. At the end of this study, Project Implicit will give you personal feedback and we will provide you with more information about the nature and purpose of the study. Participation in this study will include answering questions about yourself and taking an Implicit Association Test (IAT). This study will take approximately 12 minutes to complete.<br><p><strong>Privacy Policy:</strong></p><p>Project Implicit’s <a href="https://implicit.harvard.edu/implicit/privacy.html" target="_blank">privacy policy</a> applies to this study.</p><ul type="disc"><li>Data exchanged with this site are protected by SSL encryption. Project Implicit uses the same secure hypertext transfer protocol (HTTPS) that banks use to securely transfer credit card information. </li><li>Researchers will have access to the information you provided at registration. IP addresses are recorded but not accessible to researchers. All information will be kept confidential to the extent provided by law. </li><li>Data from this study may be publicly posted with identifying information removed. </li></ul><br>Your identity will be unknown to the researchers, and your responses will be anonymous. No identifying information will be collected. Moreover, all data will be analyzed by group averages and not by individual responses. Participation in this study is voluntary and you will receive no compensation for your participation. There are no anticipated risks or benefits to you for participation. There is no penalty for not participating and you do not have to answer any question that you do not want to answer. You may end your participation at any time by closing the study window.<br><br> Contact Dr. Colin Tucker Smith (<a href="mailto:colinsmith@ufl.edu">colinsmith@ufl.edu</a>) if you have any questions about the study.<br><br><strong>Who to contact about your rights in the study (#201902485):</strong><br />UFIRB office, Box 100173, University of Florida, Gainesville, FL 32611-2250; Phone: 352-392-0433.</p></div>'   
    },

{type: 'info',
    description: '<font color="red">Please select one of the options below. Click to select your answer, then click again to confirm.</font>'
},

{
        inherit : 'basicSelect',
        name: 'agree',
        answers: [
          'YES, I agree to participate'
        ]
      },
{
        inherit : 'basicSelect',
        name: 'disagree',
        answers: [
          'NO, I do not agree to participate.'
        ]
      }
      
      ]
    }
    
      
     ]);
 return API.script;
});
		








































