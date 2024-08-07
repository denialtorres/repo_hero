import { GraphQLClient } from "graphql-request";
import {
  getSdk,
  RepoWithReviewsQueryVariables,
  RepoWithReviewsQuery,
  ReviewRating,
} from "./generated/types";

type Repo = Extract<RepoWithReviewsQuery["repo"], { __typename: "Repo" }>;
type ReviewType = Repo["reviews"]["nodes"][number];

async function getRepoReviews(id: RepoWithReviewsQueryVariables["id"]) {
  const client = new GraphQLClient("http://localhost:3000/graphql");
  const sdk = getSdk(client);
  const query = await sdk.repoWithReviews({ id });
  const Review = ({ comment, user, rating }: ReviewType) => {
    const stars = (rating: ReviewRating) => {
      switch (rating) {
        case ReviewRating.OneStar:
          return "⭐";
        case ReviewRating.TwoStars:
          return "⭐ ⭐";
        case ReviewRating.ThreeStars:
          return "⭐ ⭐ ⭐";
        case ReviewRating.FourStars:
          return "⭐ ⭐ ⭐ ⭐";
        case ReviewRating.FiveStars:
          return "⭐ ⭐ ⭐ ⭐ ⭐";
      }
    };

    return `${stars(rating)} - ${comment} - ${user.name}`;
  };

  if (query.repo.__typename === "Repo") {
    query.repo.reviews.nodes.forEach((review) => {
      console.log(Review(review));
    });
  }
}

getRepoReviews("1");
