FROM image-registry.openshift-image-registry.svc:5000/epic-demo-bookbag/bookbag-dashboard:latest

USER root

COPY . /tmp/src
RUN cp /tmp/src/workshop/dashboard/gateway/views/dashboard.pug /opt/workshop/gateway/views/

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble
