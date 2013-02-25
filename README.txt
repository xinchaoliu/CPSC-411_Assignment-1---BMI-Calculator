/*------------------------------------------------------------------------------
----------------------------------Xinchao Liu-----------------------------------
---------------------------------BMI Calculator---------------------------------
------------------------------------------------------------------------------*/

/*  What is it?
      This is an iPhone application that allows a user to enter a subjects
      height and weight to calculate and visualize the subject's body mass
      index.                                                                  */

/*  How to use it?
      - First input the subject's height and weight value by tap on the input
      field.
      - A number pad will show up for user to input.
      - When finished, simply tap any where of the background, the keyboard
      will disappear.
      - The default is US measures, user can switch to Metric measures using
      the Metric switch. Turns one on and the other one will turn off 
      automatically.
      - After input the values, click the Calculate button to get the result.
      - Besides the BMI range, a picture which represent the calculated results
      will shown.                                                        
      - The BMI range table adapted from WHO guidelines:
         ------------------------------------------------------
         |            Category           |  BMI range (kg/m2) |
         |-----------------------------------------------------
         |         Severe Thinness       |        <16.00      |
         |        Moderate Thinness      |      16.00-16.99   |
         |          Mild Thinness        |      17.00-18.49   |
         |          Normal Range         |      18.50-24.99   |
         |           Overweight          |      25.00-29.99   |
         |    Obese Class I (Moderate)   |      30.00-34.99   |
         |    Obese Class II (Severe)    |      35.00-39.99   |
         | Obese Class III (Very Severe) |        >39.99      |
         ------------------------------------------------------               */
         
/*  Features Completed:
      - Touch background to disappear keyboard
      - Switch between US measures and Metric measures
      - Warning when receive empty input
      - Calculate BMI and show result
      - Show BMI range
      - Show different picture to visualize body mass index
      - When switch measures, clean the interface                             */
      
/*  Features not Completed:
      - All features considered have been implemented.
      - The input value will not be tested weather a number or not. Because the
      input keyboard has been limited to a number pad.                        */
      
/*  Bugs:
      - If click the measures switch rapidly, sometime the two switches become
      both on or both off. Switch the other one once will repair this bug. The 
      measures label will always show the current using measures. Not sure how 
      to fix this, I think it's ralated to the switch animation effect.       */
      
/*  External Dependancies:
      - No external dependancies.                                             */
      
/*  About the Author:
      Xinchao Liu
      Leo_Liu@csu.fullerton.edu                                               */
