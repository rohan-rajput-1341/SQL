/*
Question:What skills are required for the top paying Data Analyst jobs?
-Use the top 10 highest-paying Data Analyst roles that are available remotely to identify the most in-demand skills.
-Add the specific skills required for these roles
-Why> It provides a detailed look at which high -paying jobs demand certain skills,
       helping job seekers to focus on developing the most relevant skills for their career growth.
*/
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
       job_postings_fact
       LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL

    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY salary_year_avg DESC;

/* ============================================================
   Skills column analysis -- Query2.csv
   8 job postings, 66 rows (1 row per skill per job)
   ============================================================ */


/* ---- skill frequency (out of 8 jobs) ---- */

--  sql         ########################  8   <- every single job wants this
--  python      #####################     7
--  tableau     ##################        6
--  r           ############              4
--  pandas      #########                 3
--  excel       #########                 3
--  snowflake   #########                 3
--  azure       ######                    2
--  aws         ######                    2
--  power bi    ######                    2
--  oracle      ######                    2
--  go          ######                    2
--  numpy       ######                    2
--  gitlab      ######                    2
--  bitbucket   ######                    2
--  atlassian   ######                    2
--  jira        ######                    2
--  confluence  ######                    2
--  -- one-off skills (1 posting each) --
--  databricks, pyspark, jupyter, powerpoint,
--  hadoop, crystal, flow, sap, jenkins, git


/* ---- avg salary by skill ($) ---- */
--  (careful, only 8 jobs total, some of these are basically
--   one job's salary in disguise)

--  databricks / pyspark / jupyter / powerpoint   ~255k   <- all one AT&T posting
--  hadoop                                        ~232k
--  aws / azure / power bi                        ~222k
--  pandas / excel                                ~215k
--  r                                              ~215k
--  tableau                                       ~214k
--  sql                                           ~207k
--  python                                        ~206k
--  oracle                                        ~203k
--  go / gitlab / numpy                           ~195k
--  snowflake                                     ~193k
--  jira / confluence / bitbucket / atlassian     ~189k
