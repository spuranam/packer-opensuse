
%:
	$(eval p := $(subst /, , $*))
	$(eval target := $(word 1, $(p))-$(word 2, $(p)))
	$(eval builder := $(word 3, $(p)))
	@mkdir -p image/$(target)/
	@rm -rf image/$(target)/$(builder)
	PACKER_LOG="yes" PACKER_LOG_PATH=logs/$(builder)-$(target).log packer build -only=$(builder) $(target).json
