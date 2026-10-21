# Demo image for Cycode container scanning: the published java-sec-code app.
FROM joychou/jsc:latest
LABEL org.opencontainers.image.source="https://github.com/ali-cycode-demo/java-sec-code"
LABEL org.opencontainers.image.description="java-sec-code demo app (deliberately vulnerable)"
