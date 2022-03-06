# FairTrade 

## Team Members Roles
### Andrea Bassetti (Triangle: Machine Learning Models)
-Donald Boykin (X: README)
-Elijah Taylor (Triangle: Machine Learning Models)
-Jeff Zimmerman (Square: Repository)
-Kate Matias (Circle: Database)

## Presentation: 
For our group final Project for the 2021-2022 Columbia Boot Camp we selected the topic of Fair Trade. This data was collected anomously from tomatoe farmers. The database we used was from surveys done by migrant farmers in California. There were 2 surveys done a year apart. There were over 30 questions on the survey. The data was then complied into the Excel file we are using. We hope to determine the best conditions to determine the optimum job satisfaction. It might be a certain Farm or a certain job, but we hope to find out.
- Selected topic: We used a data set provide by Fair Trade USA. The dataset is a collection of survey responses collected at the worker level in tomato farms in mexico. The surveys aim to gain a better understanding around the workplace welbeing (pay, contracts, etc), individual wellbeing (water acces, food access, etc), the impact the certification is having, and the NPS score awarded br workers to the farm.
-Reason why we selected: The dataset hold a unique opportunity to understand if there is a link between wellbeings and the NPS score given by the workers. We are trying to understand if there are factors that are stronger predictors than others. 
- Description of the data source: The data was provided by Andrea Bassetti. It was taken directly from Qualtrics (our survey platform) and downloaded onto excel. 
- Questions we hope to answer: We are trying to understand which wellbeing attributes are best predictors for the NPS score given to the farm by the worker. If we are able to understand where the farm should focus the most efforts to improve the workers livelihood and increase worker satisfaction there will be a chain of positive effect likfe higher retention, better product, higher sales, etc. 

## GitHub: 
The team worked together on GitHub, slack, and during class time in our breakout rooms. We were even able to get a second breakout room. One room was involved in cleaning the data. The other room was where the README.md file was worked on. 

## Machine Learning Model: 
We had a few people make preliminary Machine Learning Models. The first one picked certain columns to look at, then dropped all the NAs which dropped about 30 entries of data. Looking at the x describe and y describe was what promoted the use of dropnas command. The code also used a dictionary for the number values which attached ratings for each number. This code ended in a 11 by 11 matrix with a 15% accuracy.
- The team is planning on running RandomForestClassifier to identify which attributes form the survey are the best predictor scores for the NPS score they are giving the farm. We will be running a ternary (one more than a bianry) model where there are three outcomes: promoter, neutral, or demoter. (this is a widely used score, here is more info about it: https://www.netpromoter.com/know/). We will work with the model to identify the attributes that will give us the highest accuracy and the ideal number of attributes needed to make the prediction. The majority of the data has values in the form of strings, these will be cleaned and recoded ot numerical values. 

## Database: 
When we first got the database, we looked through the excel file and did a preliminary clean up by deleting columns we didn’t need. We started out with <enter original number of columns> and ended up with <enter clean data number of columns>. We then coded in Python and read the file into the code. The cleaned file then went through additional cleaning before we put it through our Machine Learning Model.
  - we read the file into jupyter notebook, we renamed some columns and dropped others that we did not need, we removed all rows with "refused" and "dont know" values, "we recoded the values in the 'factory_recommend_tf_score' column to follow the NPS score, droppped any rows with NaN values, made sure all the columns had the right data type, and finally exported the file as a csv. 
