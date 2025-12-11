import streamlit as st
import pandas as pd
import numpy as np

st.title('Simple DataFrame Example')

# Create a simple DataFrame
data = pd.read_csv('./datasets/covid.csv')
st.subheader('DataFrame Display')
st.dataframe(data)