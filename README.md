# Bootcamp Final Project: Fair Trade 

## Team Members Roles 
### Segment 1:
#### Andrea Bassetti (Triangle: Machine Learning Models)
#### Donald Boykin (X: README)
#### Elijah Taylor (Triangle: Machine Learning Models)
#### Jeff Zimmerman (Square: Repository)
#### Kate Matias (Circle: Database)

### Segment 2:
#### Andrea Bassetti (X: README, Google SLides, Tableau
#### Donald Boykin (Circle: Database)
#### Elijah Taylor (Triangle: Machine Learning Models)
#### Jeff Zimmerman (Triangle: Machine Learning Models, Data Exploration)
#### Kate Matias (Circle: Database)


## GitHub: 
The team worked together on GitHub, Slack, and during class time in our breakout room during both class periods. After working on our section in our branch, we made make sure it was ok to merge to the main branch so as not to cause problems in our repository.
-	The whole team did a preliminary clean of the excel file
-	Experimented with data manipulation to further narrow down which columns we plan to use
-	Split the database to find connection between columns by using an inner join
-	Trying different Machine Learning Models: Random Forest classifier; Adaboost classifier; Oversampling classifier 
-	Created a google slide for visualization
-	Created a tableau for further visualization of the data


## Presentation: 
For our group final Project for the 2021-2022 Columbia Boot Camp we selected the topic of Fair Trade. This data was collected anonymously from tomato farmers. The database we used was from surveys done at different tomato farms in Mexico. Two surveys were done at each farm, one year apart. There were over 50 questions on the survey. The data was then complied into the Excel file we are using. We hope to determine the best conditions to determine the optimum job satisfaction. It might be a certain farm or a certain job, but we hope to find out.
- Selected topic: We used a data set provide by Fair Trade USA. The dataset is a collection of survey responses collected at the worker level in tomato farms in Mexico. The surveys aim to gain a better understanding around the workplace wellbeing (pay, contracts, etc.), individual wellbeing (water access, food access, etc.), the impact the certification is having, and the Net Promoter Score (NPS score) awarded by workers to the farm.
- Reason why we selected: The dataset holds a unique opportunity to understand if there is a link between wellbeing and the NPS score given by the workers. We are trying to understand if there are factors that are stronger predictors than others. 
- Description of the data source: The data was provided by Andrea Bassetti. It was taken directly from Qualtrics (a survey platform) and downloaded into Excel. 
- Questions we hope to answer: We are trying to understand which wellbeing attributes are best predictors for the NPS score given to the farm by the worker. If we are able to understand where the farm should focus the most efforts to improve the workers livelihood and increase worker satisfaction there will be a chain of positive effects on such aspects like higher retention, better product, higher sales, etc. The specific questions are: How are these 8 tomato farms in Mexico performing regarding worker wellbeing?, With what accuracy can a RandomForestClassifier model predict the NPS score* given by the workers?, Which attributes to wellbeing are the strongest predictors for the NPS score given by the workers? 
- Description of the data exploration: We experimented with different regressions to before we tried different machine learning models. This helped us figure out which columns didn’t have complete entries. Which columns to keep and drop from the original database. Which columns to split into separate databases to explore more correlation. We then did a scatter plot for further visualization of the data for further understanding.
- Description of the analysis phase: We experimented with different Machine Learning Models. Random Forest Classifier, Adaboost classifier, and Oversampling classifier. We found the that Random Forest Classifier is the best one and yielded an accuracy of 74%.


## Data Exploration Phase: 
In this phase the team decided to run preliminary linear regressions and created scatter plots. This was in an effort to give us a better underatsnding of what the data holds before inputing it into the machine learning model. For this section we used matplotlib.pyplot to create some rudimentary scatter plots. Given the size of the datasource, it was essential for us to visualize the data before working with it. Scatter plots were created to visualize the correlation between all the attributes against the NPS score. See an example below: 
![scatterplot_ex](https://github.com/andreabassetti/fairtrade/blob/main/PNGs/scatterplot_ex.jpg)

From the scatter plots created, we decided that there was potential in the data and that we would move forward with the machine learning model. See full code here: https://github.com/andreabassetti/fairtrade/blob/b7743e121c2d8184e6ba57ef241f6d596a1fd70d/Database/Data%20Exploration%20(Scatter%20Plots)%20/scatterplots.ipynb


## Machine Learning Model: 
Our Machine learning model reads in a csv file that is edited from the Fair Trade USA Excel file we started with. The Team runs a RandomForestClassifier to identify which attributes from the survey are the best at helping predict the type of NPS score they are giving the farm. We initially began running a ternary (one more than a binary) model where there were three outcomes: promoter, neutral, or detractor. (This is a widely used score, here is more info about it: https://www.netpromoter.com/know/). After observing less than ideal results, we decided to reassess the binning parameters and switch to a binary outcome model with values of either promotor or detractor. We will work with the model to identify the attributes that will give us the highest accuracy possible without overfitting and the ideal attributes needed to make the prediction. The majority of the data has values in the form of strings, these will be cleaned and recoded to numerical values as to reflect our NPS scoring system. 

https://github.com/andreabassetti/fairtrade/blob/main/Machine%20Learning%20Model/fairtrade_ML_Model_Segment2_RF_Classifier.ipynb


We first read our CSV file with 3612 entries into Jupyter Notebook

For our preprocessing of the data, we dropped all of the columns that contained large amounts of missing fields.  We then dropped the rows that contained answers of 'refused' or 'don't know'.  Next we standardized the values in the columns so that they're consistent across the column (all ints).

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

For our target variable, we assigned the column 'factory_recommended_tf_score' which would tell us whether or not the recommendation score was a promoter or demoter.

<img width="1091" alt="Screen Shot 2022-03-17 at 8 54 49 PM" src="https://user-images.githubusercontent.com/87248687/158917202-e216b92f-1196-48d7-8777-51af95154a99.png">

 Description of preliminary feature
engineering and preliminary feature
selection, including their decision-making
process 

Based off the feature importance coefficients from the preliminary model, we relied on that to distinguish which features were relevant and which were not.  We also assigned features to our model based off some of the correlations we saw during the data exploration phase (https://github.com/andreabassetti/fairtrade/blob/b7743e121c2d8184e6ba57ef241f6d596a1fd70d/Database/Data%20Exploration%20(Scatter%20Plots)%20/scatterplots.ipynb).


The data was split using the default setting of the train_test_split function splitting 75% of the data as training data and 25% of it as testing data.


We tried various different models (RandomOverSampler, Adaboost Classifier) to see how they performed against each other.
We decided to go with Random Forest Classifier since it’s a great model to choose to avoid overfitting and we could use it rank the importance of the input features.  The initial limitations seen in this model is that it has a somewhat low precision score with predicting demoters.

Below, you can see the results in our confusion matrix.


![Screen Shot 2022-03-17 at 9 04 37 PM](https://user-images.githubusercontent.com/87248687/158918038-a8de1c64-2f77-4ceb-8e67-ec876f4f30ab.png)

Based off of this model, we have an accuracy score of approximately 75% which is acceptable based on the target that we are trying to predict.


## Database: 
When we first got the database, we looked through the excel file as a team and did a preliminary clean by determining unnecessary columns to our project. We then coded in Python to finish cleaning the database.
- The file was read into Jupyter Notebook
- Some columns were renamed, and others were dropped that we did not need
- Rows were removed with "refused" and "don't know" values
- Created new entity_tenure_total_months column by merging year and month columns and recalculating
- Converted string values in the 'factory_recommend_tf_score' column to integers, and binned our new values to match NPS scoring metric
- Rows with 'NaN' values were dropped
- Made sure all the columns had the right data type
- Finally exported the file as a csv 
- We also created an ERD to visualize relationships in the database
![Screen Shot 2022-03-15 at 8 21 32 PM](https://user-images.githubusercontent.com/91562577/158493086-9058aadc-fb70-4e99-b57e-258c5abd7f8f.png)


## Visualization:
Google Slides: https://docs.google.com/presentation/d/1H1MdfxaCAsKB6ChjP8N0JzK3eiFUNFjttOr9pTG4bCU/edit?usp=sharing
### Tableau
To summarize the findings to the guiding questions of this project, we created a story board on Tableau. The first page on the story board contextualized the data source, gives a response count per farm, and shows the locations of where the responses where collected. The machine learning model page shows the final findings of the RandomForestClassifier model. It additionally there is an interactive component to see the attribute score, rank, and a correlation visualization for each attribute that was run in the model. The final page allows the user to interactivelu visualize the overall findings of the data source for each attribute. This is the data in its simplest forms that allows us to understand how each farm is performing in relation to eachother. Due to parameter limitations, this tab only displays columsn where the data source is a string. 
Link: https://public.tableau.com/app/profile/andrea.bassetti/viz/FinalProject-Story_16469645330450/Story1?publish=yes

