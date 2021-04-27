/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */
SELECT
    '#' || t.tag AS tag,
    COUNT(*) as count
FROM (
    SELECT DISTINCT
            data->>'id' AS id_tweets,
            jsonb_array_elements(
                COALESCE(data->'entities'->'hashtags','[]') ||
                COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')            
            )->>'text'::TEXT AS tag  
        FROM tweets_jsonb WHERE COALESCE(data->'extended_tweet'->'entities'->'hashtags', data->'entities'->'hashtags') @> '[{"text":"coronavirus"}]'
) t
GROUP BY tag 
ORDER BY 
    count DESC,
    tag
LIMIT 1000;
