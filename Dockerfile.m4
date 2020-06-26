m4_changequote([[, ]])

##################################################
## "volume-helper" stage
##################################################

m4_ifdef([[CROSS_ARCH]], [[FROM docker.io/CROSS_ARCH/ubuntu:20.04]], [[FROM docker.io/ubuntu:20.04]]) AS volume-helper
m4_ifdef([[CROSS_QEMU]], [[COPY --from=docker.io/hectormolinero/qemu-user-static:latest CROSS_QEMU CROSS_QEMU]])

# Install system packages
RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		bash \
		brotli \
		bzip2 \
		ca-certificates \
		cpio \
		curl \
		diffutils \
		file \
		findutils \
		gawk \
		gzip \
		jq \
		lbzip2 \
		less \
		libarchive-tools \
		locales \
		lrzip \
		lz4 \
		lzip \
		lzma \
		lzop \
		moreutils \
		nano \
		p7zip-full \
		rsync \
		tzdata \
		unzip \
		xz-utils \
		zip \
		zstd \
		zutils \
	&& rm -rf /var/lib/apt/lists/*

# Environment
ENV TERM=xterm-256color

# Setup locale
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
RUN printf '%s\n' "${LANG:?} UTF-8" > /etc/locale.gen \
	&& localedef -c -i "${LANG%%.*}" -f UTF-8 "${LANG:?}" ||:

# Setup timezone
ENV TZ=UTC
RUN printf '%s\n' "${TZ:?}" > /etc/timezone \
	&& ln -snf "/usr/share/zoneinfo/${TZ:?}" /etc/localtime

CMD ["/bin/bash"]
