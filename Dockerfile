FROM trestletech/plumber

RUN R -e 'install.packages(c("randomForest"))'

RUN mkdir /data
COPY bos_rf.rds /data
COPY bos_rf_score.R /data
WORKDIR /data

EXPOSE 8000

ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/data/bos_rf_score.R'); \
    pr$run(host='0.0.0.0', port=8000)"]