# TradingView Stuff

Contains my [TradingView](https://www.tradingview.com/) Indicators and Strategies.

# Quick Start

Create a concrete pine script which u can back-test in TradingView with:

```shell
make pine
```

# Indicators

| Name | Path | Descrption |
| --- | --- | --- |
| FTX Premium Indicator | [./indicators/ftx_premium.pine](./indicators/ftx_premium.pine) | Shows the relative price difference between Future and Spot markets on FTX. Useful for [delta neutral trading](https://ftxpremiums.com/) |

# Strategies

| Name | Template Path | Descrption |
| --- | --- | --- |
| Bollinger Bands | [./strategies/bb.envsubst.pine](./strategies/bb.envsubst.pine) | Super-configurable Bollinger Bands strategy template |

## Templates

To generate a concrete pine script, which you can use in TradingView:

```shell
make ENV=example/ema.env pine
```

# What is [FTX](https://ftx.com/)?

My favorite crypto trading platform.
Want to try? Use my [referral](https://ftx.com/profile#a=tradingviewstuff) to get a 5% discount whe u sign up.

# Roadmap

- [x] 0.1.0: Symmetric Bot: some buy/sell config same (e.g. choice of MA)
- [ ] 0.2.0: Fully Asymetric Bot: buy/sell config completely unrelated
- [ ] 0.2.0: Improved UX: Rework and document the Inputs
