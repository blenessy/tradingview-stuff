STRATEGY=bb
ENV=example/ema.env

include $(ENV)
export

.PHONY: pine
pine:
	@envsubst <strategies/$(STRATEGY).envsubst.pine
