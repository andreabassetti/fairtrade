# Bootcamp Final Project: Fair Trade 

## Overview: 
For the 2021-2022 Columbia Boot Camp final group project we selected the topic of Fair Trade. The data we used for our project was a collection of anonymous surveys from tomato farmers in Mexico that worked for Fair Trade USA. Two surveys of over 50 questions each were done at each farm, one year apart. The data was then complied into an Excel file which was our starting point for our project. Through our analysis we hope to determine the best conditions that determine the optimum job satisfaction, whether that be a preference in the farm the workers work at or a certain job.
- Selected topic: We used a data set provide by Fair Trade USA. The dataset is a collection of survey responses collected at the worker level in tomato farms in Mexico. The surveys aim to gain a better understanding around the workplace wellbeing (pay, contracts, etc.), individual wellbeing (water access, food access, etc.), the impact the certification is having, and the Net Promoter Score (NPS score) awarded by workers to the farm.
- Reason why we selected: The dataset holds a unique opportunity to understand if there is a link between wellbeing and the NPS score given by the workers. We are trying to understand if there are factors that are stronger predictors than others. 
- Description of the data source: The data was provided by Andrea Bassetti. It was taken directly from Qualtrics (a survey platform) and downloaded into Excel. 
- Questions we hope to answer: We are trying to understand which wellbeing attributes are best predictors for the NPS score given to the farm by the worker. If we are able to understand where the farm should focus the most efforts to improve the workers livelihood and increase worker satisfaction there will be a chain of positive effects on such aspects like higher retention, better product, higher sales, etc. The specific questions are: How are these 12 tomato farms in Mexico performing regarding worker wellbeing?, With what accuracy can a Random Forest Classifier model predict the NPS score given by the workers?, Which attributes to wellbeing are the strongest predictors for the NPS score given by the workers? 
- Description of the data exploration: We experimented with different regressions before we tried different machine learning models. This helped us figure out which columns didn’t have complete entries, which columns to keep and drop from the original database and which columns to split into separate databases to explore more correlation. We then did a scatter plot for further visualization of the data for further understanding.
- Description of the analysis phase: We experimented with various Machine Learning Models such as Random Forest Classifier, Adaboost classifier, and Oversampling classifier. We determined that Random Forest Classifier was the best model for our project which yielded an accuracy of 75%.
- Technologies, languages, tools, and algorithms used throughout the project: Python, Jupyter notebook, Random Forest Classifier, PGAdmin, PostgresSQL, SQLAlchemy, Tableau, Net Promoter Score, and Google slides.

This information is also summarized and presented in Google Slides here: https://docs.google.com/presentation/d/1H1MdfxaCAsKB6ChjP8N0JzK3eiFUNFjttOr9pTG4bCU/edit?usp=sharing


## Data Exploration Phase: 
In this phase the team decided to run preliminary linear regressions and created scatter plots. This was in an effort to give us a better understanding of what the data holds before inputting it into the machine learning model. For this section we used matplotlib.pyplot to create some rudimentary scatter plots. Given the size of the data source, it was essential for us to visualize the data before working with it. Scatter plots were created to visualize the correlation between all the attributes against the NPS score. See an example below: 
![scatterplot_ex](https://github.com/andreabassetti/fairtrade/blob/main/PNGs/scatterplot_ex.jpg)

From the scatter plots created, we decided that there was potential in the data and that we would move forward with the machine learning model. See full code here: https://github.com/andreabassetti/fairtrade/blob/b7743e121c2d8184e6ba57ef241f6d596a1fd70d/Database/Data%20Exploration%20(Scatter%20Plots)%20/scatterplots.ipynb


## Machine Learning Model: 
Our Machine learning model reads in a csv file that is edited from the Fair Trade USA Excel file we started with. We ran a Random Forest Classifier to identify which attributes from the survey are the best at helping predict the type of NPS score they are giving the farm. We initially began running a ternary (one more than a binary) model where there were three outcomes: promotor, neutral, or demotor. (This is a widely used score, here is more info about it: https://www.netpromoter.com/know/). After observing less than ideal results, we decided to reassess the binning parameters and switch to a binary outcome model with values of either promotor or demotor. Using a binary model for our analysis was essential in identifying the necessary attributes to make our prediction and yielded the highest accuracy possible without overfitting. The majority of the data had string values which was later cleaned and recoded to numerical values as to reflect our NPS scoring system.

See full code here:
https://github.com/andreabassetti/fairtrade/blob/main/Machine%20Learning%20Model/fairtrade_ML_Model_Segment2_RF_Classifier.ipynb


We first read our CSV file with 3612 entries into Jupyter Notebook.

For our preprocessing of the data, we dropped all of the columns that contained large amounts of missing fields.  We then dropped the rows that contained answers of 'refused' or 'don't know'.  Next, we standardized the values in the columns so that they're consistent across the column (all ints).

![Screen Shot 2022-03-17 at 8 47 59 PM](https://user-images.githubusercontent.com/87248687/158916622-a5a6c6f9-7878-4210-8079-7181c7ee5835.png)

We then dropped rows that contained nulled values.



We also then created a new column called ‘factory_recommend_tf_score' based off of binning the scores into 2 categories (0 and 1).

```
# Transform factory_recommend_tf_core to have positive or negative status
# Values 0-5 would be coded as '0' (Negative) 
# Values 6-10 would be coded as '1' (Positive)

fairtrade_df['factory_recommend_tf_score'] = pd.cut(fairtrade_df['factory_recommend_tf_core'], bins=[0, 5, 10], include_lowest=True, labels=['0', '1'])

fairtrade_df.head(20)
```

For our target variable, we assigned the column 'factory_recommended_tf_score' which would tell us whether the recommendation score was a promoter or demotor.

<img width="1091" alt="Screen Shot 2022-03-17 at 8 54 49 PM" src="https://user-images.githubusercontent.com/87248687/158917202-e216b92f-1196-48d7-8777-51af95154a99.png">

 Description of preliminary feature
engineering and preliminary feature
selection, including their decision-making
process: 

Based off the feature importance coefficients from the preliminary model, we relied on that to distinguish which features were relevant and which were not.  We also assigned features to our model based off some of the correlations we saw during the data exploration phase (https://github.com/andreabassetti/fairtrade/blob/b7743e121c2d8184e6ba57ef241f6d596a1fd70d/Database/Data%20Exploration%20(Scatter%20Plots)%20/scatterplots.ipynb).


The data was split using the default setting of the train_test_split function splitting 75% of the data as training data and 25% of it as testing data.


We tried various different models (RandomOverSampler, Adaboost Classifier) to see how they performed against each other.
We decided to go with Random Forest Classifier since it’s a great model to choose to avoid overfitting and we could use it rank the importance of the input features.  The initial limitations seen in this model is that it has a somewhat low precision score with predicting demotors.

Below, you can see the results in our confusion matrix.


![Screen Shot 2022-03-17 at 9 04 37 PM](https://user-images.githubusercontent.com/87248687/158918038-a8de1c64-2f77-4ceb-8e67-ec876f4f30ab.png)

Based off of this model, we have an accuracy score of approximately 75% which is acceptable based on the target that we are trying to predict.


## Database: 
For our Database we started off with our Fair Trade USA excel document where, as a team, we agreed on what columns were necessary to perform our analysis. The rest of the data preprocessing was coded in our fairtrade_clean_data Jupyter Notebook. First, we loaded the data, renamed some of our columns and dropped the columns we agreed we did not need for our analysis. Then we dropped the rows that contained responses such as "refused" or "Don't know". Subsequently, we changed the string values in our 'factory_recommend_tf_score' column to integers and binned our new values to match the NPS scoring metric. Values 0-5 were binned as '0' and considered to be our demotors and values 6-10 were binned as '1' and considered to be our promotors. All rows with 'NaN' values were dropped and we checked the datatypes of our columns to make sure all the columns had the right data types for our analysis. Lastly, we exported the clean data frame as a new CSV which was the basis for our machine learning model. 

https://github.com/andreabassetti/fairtrade/blob/main/Database/fairtrade_clean_data.ipynb

Next, we created an ERD to visualize the relationships in the database between fairtrade condition variables and fairtrade satisfaction variables.

![Screen Shot 2022-03-15 at 8 21 32 PM](https://user-images.githubusercontent.com/91562577/158493086-9058aadc-fb70-4e99-b57e-258c5abd7f8f.png)

The following Jupyter Notebook contains the code we used to establish a connection string using SQLAlchemy. 

https://github.com/andreabassetti/fairtrade/blob/main/Database/fairtrade_create_database.ipynb

![Screen Shot 2022-03-19 at 2 50 21 PM](https://user-images.githubusercontent.com/91925639/159134609-c84ac2c2-faa8-4161-92ed-f8d50e9b7e85.png)

Once we were able to establish our database in pgAdmin so that it would interface with our data for our project, we created two tables which correlated to our ERD. Our first table was named fairtrade_conditions and held the columns which measured the workers conditions at Fair Trade. Our second table was named fairtrade_satisfaction and held the columns which measured the satisfaction scores of workers at Fair Trade. After successfully creating our tables, we then performed an inner join on the fairtrade_conditions and fairtrade_satisfaction tables. Below is the query we used to create our tables and perform our inner join in pgAdmin.

https://github.com/andreabassetti/fairtrade/blob/main/Database/query.sql

## Visualization:
To summarize the findings to the guiding questions of this project, we created a storyboard on Tableau. The first page on the storyboard contextualizes the data source, gives a response count per farm, and shows the locations where the responses were collected. The machine learning model page shows the final findings of the Random Forest Classifier model. It additionally provides an interactive component to see the attribute score, rank, and a correlation visualization for each attribute that was run in the model. The final page allows the user to interactively visualize the overall findings of the data source for each attribute. This is the data in its simplest form that allows us to understand how each farm is performing in relation to each other. Due to parameter limitations, this tab only displays columns where the data source is a string. 
Link: https://public.tableau.com/app/profile/andrea.bassetti/viz/FinalProject-Story_16469645330450/Story1?publish=yes
