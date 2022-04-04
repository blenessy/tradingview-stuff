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

## Parameters

The below parameters are used in the ema.env template.

| Name | Description |
| --- | --- |
| `BACKTEST_START` | The start date for backtesting in UTC format, e.g. '2021-04-01T00:00:00' |
| `CHART_TICKERID` | The ticker to use in the strategy, e.g. 'FTX:BTCPERP' |
| `CHART_TIMEFRAME` | The candlestick resolution, e.g. 60 s. |
| `COMMISSION_PERCENT` | Cost of trades at exchange |
| `DEV_MODE` | Toggle development mode |
| `INITIAL_CAPITAL` | Start capital for the strategy |
| `PYRAMIDING` | Maximum number of entries allowed in the same direction. |
| `QTY_TYPE` | Determines what the value used in the `QTY_VALUE` parameter represents. Possible values are: strategy.fixed, strategy.cash, and strategy.percent_of_equity |
| `QTY_VALUE` | The quantity of `QTY_TYPE` to trade |
| `SHORT_TITLE` | Strategy title visible on chart |
| `TITLE` | Strategy title |
| **Pyramiding related configuration** |
| `PYRAMIDING_REBUY_RESISTANCE` |  |
| `PYRAMIDING_MAX_PROFIT_POSITIONS` |  |
| **Lower Band parameter configuration** |
| `LB_ALMA_OFFSET` | Arnoud Legoux Moving Average offset parameter. Controls tradeoff between smoothness (closer to 1) and responsiveness (closer to 0). |
| `LB_ALMA_SIGMA` | Changes the smoothness of ALMA. The larger sigma the smoother ALMA. |
| `LB_DEV_SCALE` | Standard deviation factor to use when calculating the Bollinger Band.|
| `LB_DEV_SOURCE` | Input source to use. |
| `LB_DEV_TYPE` | How to calculate the Bollinger Band lower band, i.e. using standard deviation or standard moving average. |
| `LB_DEV_LENGTH` | The number of candle sticks to include. |
| `LB_LONG_SOURCE` | The source input to use in the strategy, e.g. low, high, close, ohlc4, etc. |
| `LB_LONG_STRATEGY` | The trigger for long entries |
| `LB_MA_LENGTH` | Length of MA |
| `LB_MA_SOURCE` | Source of MA |
| `LB_MA_TYPE` | Type of MA, e.g. SMA, EMA, ALMA, etc. |
| `LB_VAMA_FAST_LENGTH` | Length of fast period in Volatility Adjusted Moving Average |
| `LB_VAMA_WEIGHT` | Standard deviation factor to use in VAMA. |
| **Upper Band parameter configuration** |
| `UB_ALMA_OFFSET` | Arnoud Legoux Moving Average offset parameter. Controls tradeoff between smoothness (closer to 1) and responsiveness (closer to 0). |
| `UB_ALMA_SIGMA` | Changes the smoothness of ALMA. The larger sigma the smoother ALMA. |
| `UB_DEV_SCALE` | Standard deviation factor to use when calculating the Bollinger Band.|
| `UB_DEV_SOURCE` | Input source to use. |
| `UB_DEV_TYPE` | How to calculate the Bollinger Band lower band, i.e. using standard deviation or standard moving average. |
| `UB_DEV_LENGTH` | The number of candle sticks to include. |
| `UB_LONG_SOURCE` | The source input to use in the strategy, e.g. low, high, close, ohlc4, etc. |
| `UB_LONG_STRATEGY` | The trigger for short entries |
| `UB_MA_LENGTH` | Length of MA |
| `UB_MA_SOURCE` | Source of MA |
| `UB_MA_TYPE` | Type of MA, e.g. SMA, EMA, ALMA, etc. |
| `UB_VAMA_FAST_LENGTH` | Length of fast period in Volatility Adjusted Moving Average |
| `UB_VAMA_WEIGHT` | Standard deviation factor to use in VAMA. |

# What is [FTX](https://ftx.com/)?

My favorite crypto trading platform.
Want to try? Use my [referral](https://ftx.com/profile#a=tradingviewstuff) to get a 5% discount whe u sign up.

# Roadmap

- [x] 0.1.0: Symmetric Bot: some buy/sell config same (e.g. choice of MA)
- [ ] 0.2.0: Fully Asymetric Bot: buy/sell config completely unrelated
- [ ] 0.2.0: Improved UX: Rework and document the Inputs
