CREATE INDEX tweets_jsonb_idx_extendedtags ON tweets_jsonb USING gin(COALESCE(data->'extended_tweet'->'entities'->'hashtags', data->'entities'->'hashtags'));
CREATE INDEX tweets_jsonb_idx_fts ON tweets_jsonb USING gin(to_tsvector('english',COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
