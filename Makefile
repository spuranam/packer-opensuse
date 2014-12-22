
install:
	$(eval TPL := $(filter-out $@,$(MAKECMDGOALS)))
	$(eval objects := $(wildcard $(shell jq -r '.["post-processors"][][.["post-processors"][] | length - 1 ].output' $(TPL).json)/*))
	$(foreach object,$(objects), $(shell cp -f $(object) $(DESTDIR)/))

build:
	$(eval TPL := $(filter-out $@,$(MAKECMDGOALS)))
	$(eval builders := $(shell jq '.builders[] | .type' $(TPL).json | tr -d '"'))
	$(eval outputdir := $(CURDIR)/output/$(TPL))
	find $(CURDIR)/output/ -maxdepth 1 -name '$(TPL)-*' -type d -print0 | xargs -0 -I {} /bin/rm -r "{}"
	@echo building $(TPL)
	$(foreach builder,$(builders), PACKER_LOG="yes" PACKER_CONFIG=$(CURDIR)/.packerconfig PACKER_LOG_PATH=$(CURDIR)/logs/$(TPL).log packer -machine-readable build -only=$(builder) $(TPL).json;)


%:
	@:
