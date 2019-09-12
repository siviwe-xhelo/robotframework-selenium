# THIS FILE CREATES RUNNABLE ROBOT TEST
FROM scsdevops/robotframework:1

MAINTAINER Gavin Tys
LABEL description Robot Framework in Docker for SBSA tests.

ENV TEST_TAG Regression


WORKDIR /opt/robotframework/sbsa
ADD Actions /opt/robotframework/sbsa/Actions
ADD keywords /opt/robotframework/sbsa/keywords
ADD reports /opt/robotframework/sbsa/reports
ADD resources /opt/robotframework/sbsa/resources
ADD tests /opt/robotframework/sbsa/tests

# Update system path
# ENV PATH=/opt/robotframework/bin:/opt/robotframework/drivers:$PATH

# Execute all robot tests
# CMD ["/opt/robotframework/sbsa/runTests.sh"]
CMD xvfb-run \
    --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
    robot \
    --outputDir /opt/robotframework/sbsa/reports \
    ${ROBOT_OPTIONS} \
    -i ${TEST_TAG} \
    /opt/robotframework/sbsa/tests
