AWS_ACCESS_KEY=$(cat $ENV_DIR/AWS_ACCESS_KEY)
AWS_SECRET_KEY=$(cat $ENV_DIR/AWS_SECRET_KEY)

BUCKET=kajabi-pipeline-staging-build-cache

cd $CACHE_DIR

rclone cat :s3:$BUCKET/dummy/build-cache.tar.gz \
  --s3-access-key-id $AWS_ACCESS_KEY \
  --s3-secret-access-key $AWS_SECRET_KEY \
  --s3-provider AWS \
  --s3-region us-east-1 \
  | tar -xpzvf -
