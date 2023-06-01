SELECT
q1.id,
re.comments
FROM
(SELECT
id,
review_scores_rating,
number_of_reviews
FROM listing_airbnb_boston_ready
WHERE review_scores_rating >= 80
ORDER BY review_scores_rating DESC, number_of_reviews DESC) q1
JOIN reviews_airbnb_boston_ready re
ON q1.id = re.listing_id