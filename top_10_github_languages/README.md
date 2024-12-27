# Top 10 GitHub Languages Analysis 📊

## Project Overview  
This project analyzes the top 10 programming languages used on GitHub based on repository counts. The data was sourced from **BigQuery Public Dataset (`github_repos`)** and visualized using **Looker Studio**.  

---

## Why This Data Matters 💡

### Guiding Developers and Aspiring Developers  
- **Popular Languages**: Focus on mastering widely-used languages to increase job opportunities.  
- **Trendy Tools**: Learn relevant libraries and frameworks based on this data.  

### Helping Businesses  
- **Technology Adoption**: Identify popular technologies for long-term support.  
- **Hiring Trends**: Focus hiring efforts on in-demand skills.  

### Industry Skills  
Web technologies (**HTML, CSS, JavaScript**) dominate, reflecting the growth of frontend libraries and frameworks.  

### Open-Source Contributions  
- Developers can strengthen portfolios by contributing to open-source projects.  
- Businesses can reduce development costs by leveraging popular tools.  

---

## Methodology 🛠️

### SQL Query Used:  
```sql
SELECT 
  language.name, 
  COUNT(language.name) AS language_count
FROM 
  `bigquery-public-data.github_repos.languages`,
  UNNEST(language) AS language
GROUP BY 
  language.name
ORDER BY 
  language_count DESC
LIMIT 10;
```
## Key Learnings 📚
Encountered and resolved an array struct error by using UNNEST() to flatten nested data.
Improved skills in handling hierarchical datasets and aggregation queries in BigQuery.

## Insights 🧐
Top 10 Languages:
JavaScript,
CSS,
HTML,
Shell,
Python,
Ruby,
Java,
PHP,
C,
C++

## Visualizations 📈

[Top 10 GitHub Languages](https://github.com/iamatinad/data_analytics_projects/blob/main/top_10_github_languages/top_10_github_languages.jpg)
  <img src="https://github.com/iamatinad/data_analytics_projects/blob/main/top_10_github_languages/top_10_github_languages.jpg" alt="Top Languages">


## Tools Used 🛠️
BigQuery - For querying datasets.
Looker Studio - For creating visualizations.
Markdown/GitHub - For project documentation and sharing.
Adobe Acrobat - To convert pdf to jpg
Notion - to take notes

**Full PDF Version:** [Download Visualization](https://github.com/iamatinad/data_analytics_projects/blob/main/top_github_languages.pdf)



### Author 📝
- **Danita Lamptey**
- **Date: 27/12/2024**

📫Email: lamptey.danita@gmail.com
