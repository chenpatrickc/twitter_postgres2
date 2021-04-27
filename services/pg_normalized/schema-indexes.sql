CREATE INDEX tweettags_idx_tagtweets ON tweet_tags(tag, id_tweets);
CREATE INDEX tweettags_idx_tweetstag ON tweet_tags(id_tweets, tag);
CREATE INDEX tweets_idx_tweetslang on tweets(id_tweets, lang);
CREATE INDEX tweets_idx_fts on tweets USING gin(to_tsvector('english', text));
