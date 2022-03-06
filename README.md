# FairTrade 

## Team Members Roles
#### Andrea Bassetti (Triangle: Machine Learning Models)
#### Donald Boykin (X: README)
#### Elijah Taylor (Triangle: Machine Learning Models)
#### Jeff Zimmerman (Square: Repository)
#### Kate Matias (Circle: Database)

## Presentation: 
For our group final Project for the 2021-2022 Columbia Boot Camp we selected the topic of Fair Trade. This data was collected anonymously from tomato farmers. The database we used was from surveys done by migrant farmers in California. There were 2 surveys done a year apart. There were over 30 questions on the survey. The data was then complied into the Excel file we are using. We hope to determine the best conditions to determine the optimum job satisfaction. It might be a certain Farm or a certain job, but we hope to find out.
- Selected topic: We used a data set provide by Fair Trade USA. The dataset is a collection of survey responses collected at the worker level in tomato farms in Mexico. The surveys aim to gain a better understanding around the workplace wellbeing (pay, contracts, etc), individual wellbeing (water access, food access, etc), the impact the certification is having, and the NPS score awarded by workers to the farm.
- Reason why we selected: The dataset holds a unique opportunity to understand if there is a link between wellbeing and the NPS score given by the workers. We are trying to understand if there are factors that are stronger predictors than others. 
- Description of the data source: The data was provided by Andrea Bassetti. It was taken directly from Qualtrics (our survey platform) and downloaded onto excel. 
- Questions we hope to answer: We are trying to understand which wellbeing attributes are best predictors for the NPS score given to the farm by the worker. If we are able to understand where the farm should focus the most efforts to improve the workers livelihood and increase worker satisfaction there will be a chain of positive effects on such aspects like higher retention, better product, higher sales, etc. 

## GitHub: 
The team worked together on GitHub, Slack, and during class time in our breakout room during both class periods. After working on our section in our branch, we made make sure it was ok to merge to the main branch so as not to cause problems in our repository.

## Machine Learning Model: 
Our Machine learning model reads in a csv file that is edited from the Fair Trade USA Excel file we started with. The Team runs a RandomForestClassifier to identify which attributes form the survey are the best predictor scores for the NPS score they are giving the farm. We will be running a ternary (one more than a binary) model where there are three outcomes: promoter, neutral, or demoter. (This is a widely used score, here is more info about it: https://www.netpromoter.com/know/). We will work with the model to identify the attributes that will give us the highest accuracy and the ideal number of attributes needed to make the prediction. The majority of the data has values in the form of strings, these will be cleaned and recoded to numerical values as to reflect our NPS scoring system. 
- Reads a CSV file with 3612 entries into Jupyter Notebook
- Drops ‘factory_recommend_tf_core’ and set as the test case 
- From the rest of the database, make prediction using the RandomForestClassifier
- Makes a Confusion Matrix from the data with a 62.7% accuracy
- Determines the most important aspects (age_core)


## Database: 
When we first got the database, we looked through the excel file as a team and did a preliminary clean by determining unnecessary columns to our project. We then coded in Python to finish cleaning the database.
- The file was read into Jupyter Notebook
- Some columns were renamed, and others were dropped that we did not need
- Rows were removed with "refused" and "dont know" values
- The 'factory_recommend_tf_score' column to record our new values to follow the NPS score
- Rows with 'NaN' values were dropped
- Made sure all the columns had the right data type
- Finally exported the file as a csv 
