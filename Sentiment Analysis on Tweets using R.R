install.packages("dplyr")
install.packages("tidytext")
install.packages("ggplot2")


# Load necessary libraries
library(dplyr)
library(tidytext)
library(ggplot2)

# Step 1: Sample tweet data (instead of Twitter API)
tweets <- data.frame(
  status_id = 1:5,
  text = c(
    "Hello this is R programming",
    "Sometimes its so annoying to run the code. ",
    "the weather is good today!",
    "I dont like bugs.",
    "R is so easy programming and visualization language."
  )
)

# Step 2: Clean and tokenize tweet text
tweet_words <- tweets %>%
  unnest_tokens(word, text)

# Remove stop words
data("stop_words")
clean_words <- tweet_words %>%
  anti_join(stop_words)

# Step 3: Perform sentiment analysis using Bing lexicon
sentiment <- clean_words %>%
  inner_join(get_sentiments("bing"))

# Print sentiment words
print(sentiment)

# Step 4: Visualize sentiment distribution
sentiment %>%
  count(sentiment, sort = TRUE) %>%
  ggplot(aes(x = reorder(sentiment, -n), y = n, fill = sentiment)) +
  geom_col() +
  labs(
    title = "Sentiment Analysis of Sample Tweets",
    x = "Sentiment",
    y = "Word Count"
  ) +
  theme_minimal()
