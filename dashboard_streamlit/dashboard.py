from altair import Description
import streamlit as st
from connect_data_warehouse import query_job_listings


def layout():
    df = query_job_listings()

    st.title("Econom job ads")
    st.write(
        "This dashboard shows Econom related job ads from Arbetsförmedlingens API. "
    )

    st.markdown("## Vacancies")
    cols = st.columns(4)

    with cols[0]:
        st.metric(label="Total", value=df["VACANCIES"].sum())

    with cols[1]:
        st.metric(
            label="In Stockholm",
            value=df.query("WORKPLACE_CITY == 'Stockholm'")["VACANCIES"].sum(),
        )

    with cols[2]:
        st.metric(
            label="In Göteborg",
            value=df.query("WORKPLACE_CITY == 'Göteborg'")["VACANCIES"].sum(),
        )
    
    with cols[3]:
        st.metric(
            label="In Uppsala",
            value=df.query("WORKPLACE_CITY == 'Uppsala'")["VACANCIES"].sum(),
        )

    cols = st.columns(3)

    with cols[0]:
        st.markdown("### Per city")
        st.dataframe(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        workplace_city
                    FROM 
                        mart_job_listnings
                    GROUP BY 
                        workplace_city
                    ORDER BY vacancies DESC LIMIT 8;
                    """
            )
        )
    with cols[1]:
        st.markdown("### Per company (top 10)")
        st.bar_chart(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        employer_name
                    FROM 
                        mart_job_listnings
                    GROUP BY 
                        employer_name
                    ORDER BY vacancies DESC LIMIT 10;
                    """
            ),
            x="EMPLOYER_NAME",
            y="VACANCIES",
        )
        with cols[2]:
            st.markdown("### Per duration (top 5)")
            st.bar_chart(
                query_job_listings(
                    """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        duration
                    FROM 
                        mart_job_listnings
                    GROUP BY 
                        duration
                    ORDER BY vacancies DESC LIMIT 5;
                    """
            ),
            x="DURATION",
            y="VACANCIES",
        )

    st.markdown("## Find advertisement")
    cols = st.columns(2)
    with cols[0]:
        selected_city = st.selectbox(
            "Select a city:", df["WORKPLACE_CITY"].unique()
        )
    with cols[1]:
        selected_headline = st.selectbox(
            "Select an advertisement:",
            df.query("EMPLOYER_NAME == @selected_city")["HEADLINE"],
        )

    st.markdown("### Job ad")
    st.markdown(
        df.query(
            "HEADLINE == @selected_headline and EMPLOYER_NAME == @selected_company"
        )["DESCRIPTION_HTML_FORMATTED"].values[0],   
        unsafe_allow_html=True,
    )

    st.markdown("## Job listings data")
    
    st.dataframe(df)

if __name__ == "__main__":
    layout()