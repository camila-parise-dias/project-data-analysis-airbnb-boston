SELECT
li.property_type,
COUNT(q1.id) total_property_type,
COUNT(CASE WHEN bedrooms = 0 THEN 1 END) 0_bedroom,
COUNT(CASE WHEN bedrooms = 1 THEN 1 END) 1_bedroom,
COUNT(CASE WHEN bedrooms = 2 THEN 1 END) 2_bedrooms,
COUNT(CASE WHEN bedrooms = 3 THEN 1 END) 3_bedrooms,
COUNT(CASE WHEN bedrooms = 4 THEN 1 END) 4_bedrooms,
COUNT(CASE WHEN bedrooms = 5 THEN 1 END) 5_bedrooms
FROM
(SELECT
id,
review_scores_rating,
number_of_reviews
FROM listing_airbnb_boston_ready
WHERE review_scores_rating >= 80
ORDER BY review_scores_rating DESC, number_of_reviews DESC) q1
JOIN listing_airbnb_boston_ready li
ON q1.id = li.id
GROUP BY li.property_type
ORDER BY total_property_type DESC