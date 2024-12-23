# CoreVision Business Travel Program Performance

CoreVision Systems is a global technology company which primarily sells enterprise resource planning software worldwide for small to medium sized businesses. 

As part of the larger company initiative to reduce costs, CoreVision’s Business Travel Program managers need reporting on whether or not the current rate the company is spending on business travel is competitive compared to the market rate for comparable hotel stays. At the end of 2023, program managers are focused on the overall performance of the travel program over the year of 2023, with particular interest in October 2023, which is the month CoreVision sees the largest volume of business travel for its employees.

This project analyzes CoreVision’s travel data, combined with aggregated market travel data, in order to uncover critical insights that will improve financial management of costs associated with CoreVision’s business travel program.

Insights and recommendations are provided in the following key areas:

- Spending Trend Analysis: Evaluation of historical average daily spend patterns on hotels, including comparisons with market daily rate, month-over-month, and year-over-year metrics.
- Brand Level Spend: An analysis of CoreVision hotel spend by top 5 hotel brands, including comparisons with month-over-month and market spend.
- Business Travel Program Success: An assessment of CoreVision’s realized and potential cost savings based on approved booking channel usage rate and negotiated discount rate.

The interactive Tableau dashboard can be found [here](https://public.tableau.com/views/CoreVisionBusinessTravelProgramPerformanceDashboard/CoreVision_2023?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

The SQL queries used to organize and prepare data for the dashboard can be found [here](https://github.com/lksing/CoreVision-Business-Travel-Program-Performance/blob/main/SQL-prep.txt).

### Data Structure and Validation
The CoreVision Travel Program database structure as seen below consists of four tables: searches, results, bookings, customers.

![CoreVision drawio](https://github.com/user-attachments/assets/317aa19c-a74c-4387-bf86-7aca4882996f)

The SQL queries used to organize and prepare data for the dashboard can be found [here](https://github.com/lksing/CoreVision-Business-Travel-Program-Performance/blob/main/SQL-prep.txt).

### Executive Summary
In October 2023, CoreVision has seen a significant $40,000 in cost savings from negotiated travel rates afforded by partnerships with Hilton and Marriott. Key performance indicators have shown that CoreVisions’s negotiated rates in October 2023 are competitive, with the average daily spend of 18% below comparable market rates, and cost savings for the month down 198% from public market rates. To continue the program’s success moving forward, CoreVision should prioritize relationships with Hilton and Marriott and consider negotiating a 3% increase in the negotiated discount rate with Courtyard by Marriott from 20% to 23%, which can win an estimated $13,500 increase in savings. A 3% increase in the negotiated discount rate with Hilton Garden Inn from 15% to 18% can generate an estimated $13,000 in cost savings.

### Trends
Spending Trends:
- CoreVision has the most competitive rates in the months of March and October 2023 with average spending 17%+ below the market average for comparable rooms. This corresponds to seasonality patterns of the strongest months of business with largest volumes of bookings. The least competitive rates are in the months of February and May with average spending of 8% and 10%, respectively, below the market average for comparable rooms, corresponding to weakest months of business travel.
- The full year of 2023 improved over 2022 by main performance indicators of cost savings and average % difference from market daily spend. Average daily spend in 2023 was slightly lower than that of 2022, and the 2023 average % from market daily spend saw improvements in negotiated rates in the second half of the year when compared to 2022. This is due to the months of February and May in the first half of the year which saw least competitive negotiated rates.

Brand Level Analysis:
- Courtyard by Marriott and Hilton Garden Inn were consistently the top 2 most-booked brands, which coincided with our expectations for Courtyard as the lowest-cost from average daily spend due to the negotiated rate.
- Residence Inn by Marriott was the least booked of the top 5 brands, corresponding with the highest average daily spend and lowest cost savings. In October 2023, Residence Inn also has comparatively lower average approved channel usage rate — 57% vs. next highest 71%.

Business Travel Program Success:
- While the top 2 booked brands Courtyard by Marriott and Hilton Garden Inn result in approximately $100K in spending in October 2023, the two brands have competitive average negotiated rates of 21% and 24% below comparable market rates (respectively), resulting in approximately $29,000 of cost savings.
- Besides Residence Inn, all other top 4 brands have on-target competitive average negotiated rates of 15%+ below comparable market rates.

### Recommendations
- With 60%+ of top 5 hotel bookings coming from Courtyard by Marriott and Hilton Garden Inn, prioritizing relationships and competitive contracts with these hotel brands are crucial. Maintaining strong booking volume from 2022 and 2023 will keep CoreVision on track to fulfilling negotiation requirements.
- Consider negotiating a 3% increase in the negotiated discount rate with Courtyard by Marriott from 20% to 23%, which can win an estimated $13,500 increase in savings. If that negotiation succeeds, CoreVision may also have more leverage and can also consider a 3% increase in the negotiated discount rate with Hilton Garden Inn from 15% to 18%, which can generate an estimated $13,000 in cost savings.
- While Courtyard by Marriott is the highest booked hotel brand in October 2023, it has an unusually low approved channel usage rate at 76%, compared to the second highest booked brand Hilton Garden Inn at an approved channel usage rate of 90%. If the Courtyard by Marriott brand can see an increase of approved channel usage to 90%, CoreVision can see an estimated $10,000 in cost savings over a 1 year period.
- Courtyard by Marriott’s usually low channel usage rate may an issue with availability for this brand through the approved channel. Discuss with technology teams involved with this channel tool to ensure the content offered is up-to-date. If the problem still hasn’t been found, speak with the Marriott business travel director.
- Campaigns for employee awareness to use the approved booking channels can help win more cost savings, especially for brands such as Residence Inn and Tempo by Hilton, which see moderately lower compliance levels. Raising Residence Inn’s approved channel rate to the average of 76% result in an estimated $8,600 in cost savings over a 1 year period.
