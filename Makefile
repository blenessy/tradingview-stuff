STRATEGY=bb
ENV=example/ema.env

include $(ENV)
export

.PHONY: pine
pine:
	@sh -e strategies/$(STRATEGY).sh.pine
