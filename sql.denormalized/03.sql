/*
 * Calculates the languages that commonly use the hashtag #coronavirus
 */

SELECT
    lang,
    COUNT(*) as count
FROM (
    SELECT DISTINCT
            data->>'id' AS id_tweets,
            data->>'lang' AS lang
        FROM tweets_jsonb WHERE COALESCE(data->'extended_tweet'->'entities'->'hashtags', data->'entities'->'hashtags') @> '[{"text":"coronavirus"}]'
) t
GROUP BY lang 
ORDER BY 
    count DESC,
    lang;
