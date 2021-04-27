/*
 * Count the number of tweets that use #coronavirus
 */
SELECT
    COUNT(DISTINCT data->>'id')
FROM tweets_jsonb 
WHERE COALESCE(data->'extended_tweet'->'entities'->'hashtags', data->'entities'->'hashtags') @> '[{"text":"coronavirus"}]';
