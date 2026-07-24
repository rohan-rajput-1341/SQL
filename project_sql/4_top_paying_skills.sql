/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills for Data Analysts:
- Big Data & ML tools lead the pack: pyspark ($208K), databricks ($142K), and
  elasticsearch ($145K) reflect strong demand at the intersection of data
  analysis and data engineering.
- Software dev & deployment skills carry high value: bitbucket ($189K),
  gitlab ($154K), kubernetes ($132K), airflow ($126K), and jenkins ($125K)
  show that analysts comfortable with dev/deploy tooling earn a premium.
- Cloud platforms pay well: couchbase ($160K), datarobot ($155K), and
  gcp ($122K) point to growing demand for cloud-based analytics platforms.
- Python libraries remain valuable: pandas ($151K), jupyter ($152K), and
  numpy ($143K) confirm that strong Python and data wrangling skills are
  highly rewarded across Data Analyst roles.

Takeaway: Analysts aiming to increase earning potential should consider
upskilling in big data tools, cloud platforms, and dev/deployment tooling,
alongside strengthening core Python analytics skills.
*/