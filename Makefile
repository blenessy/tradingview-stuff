STRATEGY=bb
ENV=defaults/$(STRATEGY).env

include $(ENV)
export

.PHONY: pine
pine:
	envsubst <strategies/$(STRATEGY).envsubst.pine
