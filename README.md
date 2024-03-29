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

| Name | Default | Description |
| --- | --- | --- |
| `BACKTEST_END` | '2022-04-01T00:00:00' | See separate chapter about this below. |
| `CHART_TICKERID` | '60' | The ticker to use in the strategy, e.g. 'FTX:BTCPERP' |
| `CHART_TIMEFRAME` | 'FTX:BTCPERP' | The candlestick resolution, e.g. 60s. |
| `COMMISSION_PERCENT` | 0.07 | Cost of trades at exchange |
| `DEV_MODE` | true | Toggle development mode |
| `INITIAL_CAPITAL` | 1000 | Start capital for the strategy |
| `LONG_TRADES` | true | Whether to enable long (buying) trades |
| `PYRAMIDING` | 1 | Maximum number of entries allowed in the same direction. |
| `QTY_TYPE` | strategy.cash | Determines what the value used in the `QTY_VALUE` parameter represents. Possible values are: strategy.fixed, strategy.cash, and strategy.percent_of_equity |
| `QTY_VALUE` | 100 | The quantity of `QTY_TYPE` to trade |
| `SHORT_TITLE` | 'BBS' | Strategy title visible on chart |
| `SHORT_TRADES` | true | Whether to enable short (selling) trades |
| `STOP_LOSS_PERCENT` | 100 | When to close a loosing position. |
| `TITLE` | 'Bollinger Bands Strategy' | Strategy title |
| `TAKE_PROFIT_PERCENT` | 100 | When to close a winning position. |
| **Bollinger Bands common configuration** |
| `ALMA_OFFSET` | 0.85 | Arnoud Legoux Moving Average offset parameter. Controls tradeoff between smoothness (closer to 1) and responsiveness (closer to 0). |
| `ALMA_SIGMA` | 6 | Changes the smoothness of ALMA. The larger sigma the smoother ALMA. |
| `DEV_TYPE` | 'STD' | How to calculate the Bollinger Band, i.e. using standard deviation or absolute deviation. |
| `DEV_SCALE` | 2 | Deviation factor to use when calculating the Bollinger Band. |
| `MA_TYPE` | 'EMA' | Moving Average type, e.g. SMA, EMA, ALMA, etc. |
| `MA_SOURCE` | | The source input to use for MA, e.g. low, high, close, ohlc4, etc. |
| `MA_LENGTH` | 9 | Number of candle sticks to include in calculation |
| `SOURCE` | close |  The source input to use in the strategy, e.g. low, high, close, ohlc4, etc. |
| `VAMA_FAST_LENGTH` | 3 | Length of fast period in Volatility Adjusted Moving Average. |
| `VAMA_WEIGHT` | 0.2 | VAMA weight factor. |
| **Lower Band configuration** |
| `LB_ALMA_OFFSET` | `ALMA_OFFSET` | Overrides `ALMA_OFFSET`. |
| `LB_ALMA_SIGMA` | `ALMA_SIGMA` | Overrides `ALMA_SIGMA`. |
| `LB_DEV_TYPE` | `DEV_TYPE` | Overrides `DEV_TYPE`. |
| `LB_DEV_SOURCE` | `LB_MA_SOURCE` | Overrides `LB_MA_SOURCE`. |
| `LB_DEV_LENGTH` | `LB_MA_LENGTH` | Overrides `LB_MA_LENGTH`. |
| `LB_DEV_SCALE` | `DEV_SCALE` | Overrides `DEV_SCALE`. |
| `LB_LONG_SOURCE` | `SOURCE` | Overrides `SOURCE`. |
| `LB_LONG_STRATEGY` | 'Price x-under MA' | The trigger for long entries. |
| `LB_MA_LENGTH` | `MA_LENGTH` | Overrides `MA_LENGTH`. |
| `LB_MA_SOURCE` | `MA_SOURCE` | Overrides `MA_SOURCE`. |
| `LB_MA_TYPE` | `MA_TYPE` | Overrides `MA_TYPE`. |
| `LB_VAMA_FAST_LENGTH` | `VAMA_FAST_LENGTH` | Overrides `VAMA_FAST_LENGTH`. |
| `LB_VAMA_WEIGHT` | `VAMA_WEIGHT` | Overrides `VAMA_WEIGHT`. |
| **Long position confirmation configuration** |
| `LONG_CONFIRMATION` | 'Disabled' | Enables confirmation of long positions based on selected method, e.g. `RSI` |
| `LONG_CONFIRMATION_SOURCE` | ohlc4 | The source input to use, e.g. low, high, close, ohlc4, etc. |
| `LONG_CONFIRMATION_LENGTH` | 10 | Number of candle sticks to include in calculation |
| `LONG_CONFIRMATION_LIMIT` | 30 | Limit that needs to be crossed down to confirm long position |
| **Upper Band configuration** |
| `UB_ALMA_OFFSET` | `ALMA_OFFSET` | Overrides `ALMA_OFFSET`. |
| `UB_ALMA_SIGMA` | `ALMA_SIGMA` | Overrides `ALMA_SIGMA`. |
| `UB_DEV_TYPE` | `DEV_TYPE` | Overrides `DEV_TYPE`. |
| `UB_DEV_SOURCE` | `UB_MA_SOURCE` | Overrides `UB_MA_SOURCE`. |
| `UB_DEV_LENGTH` | `UB_MA_LENGTH` | Overrides `UB_MA_LENGTH`. |
| `UB_DEV_SCALE` | `DEV_SCALE` | Overrides `DEV_SCALE`. |
| `UB_LONG_SOURCE` | `SOURCE` | Overrides `SOURCE`. |
| `UB_LONG_STRATEGY` | 'Price x-under MA' | The trigger for long entries. |
| `UB_MA_LENGTH` | `MA_LENGTH` | Overrides `MA_LENGTH`. |
| `UB_MA_SOURCE` | `MA_SOURCE` | Overrides `MA_SOURCE`. |
| `UB_MA_TYPE` | `MA_TYPE` | Overrides `MA_TYPE`. |
| `UB_VAMA_FAST_LENGTH` | `VAMA_FAST_LENGTH` | Overrides `VAMA_FAST_LENGTH`. |
| `UB_VAMA_WEIGHT` | `VAMA_WEIGHT` | Overrides `VAMA_WEIGHT`. |
| **Short position confirmation configuration** |
| `SHORT_CONFIRMATION` | 'Disabled' | Enables confirmation of short positions based on selected method, e.g. `RSI` |
| `SHORT_CONFIRMATION_SOURCE` | ohlc4 | The source input to use, e.g. low, high, close, ohlc4, etc. |
| `SHORT_CONFIRMATION_LENGTH` | 10 | Number of candle sticks to include in calculation |
| `SHORT_CONFIRMATION_LIMIT` | 70 | Limit that needs to be crossed up to confirm short position |
| **Pyramiding related configuration** |
| `PYRAMIDING_REBUY_RESISTANCE` | 0.01 | (avg. position price / `LB_LONG_SOURCE` price) >= `PYRAMIDING_REBUY_RESISTANCE` before considering to open new long-position. |
| `PYRAMIDING_REBUY_USE_POS_AVG_PRICE` | true | When considering to rebuy use the open position's average price instead of the last opened position. |
| `PYRAMIDING_IRREDUCIBLE_POSITIONS` | 100 | Number of position to keep open for profit, the rest will be closed at beak-event to protect bot from long downtrends. Set to >= `PYRAMIDING` to disable. |
| `BARS_LIMIT` | 1000 | Number of bars allowed in a trade |
| `BARS_LIMIT_BREAK_EVEN` | false | Wait for a break-even (or profitable) position before closing |
| **Trailing Stop Loss configuration** |
| `TSL_TYPE` | 'ATR' | Trailing stop loss type, i.e. how the trailing stop loss is calculated. Options are Average True Range (ATR) and Percent. |
| `TSL_SOURCE` | close |  |
| `TSL_CLOSE_LONG_SOURCE` | low | The source to compare with in order to trigger the stop loss for longs. |
| `TSL_CLOSE_SHORT_SOURCE` | high | The source to compare with in order to trigger the stop loss for shorts. |
| `TSL_PERCENT` | 18 | Percent to use when Percent is selected as trailing stop loss type. |
| `TSL_ATR_LENGTH` | 100 | Number of bars when calculating Average True Range. Used when ATR is selected as trailing stop loss type. |
| `TSL_ATR_MULTIPLIER` | 16 | Multiplier, i.e., number of ATRs to use when calculating the trailing stop loss. Used when ATR is selected as trailing stop loss type. |
| **Input configuration** |
| `LB_ALMA_INPUT_PREFIX` | hidden_input_ | Set to `input.` if you want the args to show up in the configuration (Inputs tab). |
| `UB_ALMA_INPUT_PREFIX` | hidden_input_ | Set to `input.` if you want the args to show up in the configuration (Inputs tab). |
| `LB_VAMA_INPUT_PREFIX` | hidden_input_ | Set to `input.` if you want the args to show up in the configuration (Inputs tab). |
| `UB_VAMA_INPUT_PREFIX` | hidden_input_ | Set to `input.` if you want the args to show up in the configuration (Inputs tab). |
| `SC_ALMA_INPUT_PREFIX` | input. | Set to `hidden_input_` if you want the args to be hidden in the configuration (Inputs tab). |
| `LC_ALMA_INPUT_PREFIX` | input. | Set to `hidden_input_` if you want the args to be hidden in the configuration (Inputs tab). |
| `SC_VAMA_INPUT_PREFIX` | hidden_input_ | Set to `input.` if you want the args to show up in the configuration (Inputs tab). |
| `LC_VAMA_INPUT_PREFIX` | hidden_input_ | Set to `input.` if you want the args to show up in the configuration (Inputs tab). |
| **UI configuration** |
| `SHOW_INFO_BOX` | false | Show/hide information box about the strategy performance. When set to `false`, info is instead in the `ⓘ` tooltip. |
| `SHOW_SIGNAL_MARKERS` | false | Show/hide yellow dots below/above chart, marking where price crossed upper/lower band. |

### Back-testing and Forward-testing

Inspired by [this article](https://www.investopedia.com/articles/trading/10/backtesting-walkforward-important-correlation.asp) and
according to industry best-practices in training neural networks, a good Bot should perform equally well on both new and old data sets. The opposite - a "bad" BOT - usually perfoms perfectly on the backtested data but fails miserable in real trades.
This phenomenon is known as [ovefitting](https://en.wikipedia.org/wiki/Overfitting) in Machine Learning.

This Bot supports both back-testing and forward-testing to minimise overfitting. 

Back-testing is enabled with `DEV_MODE=true`. The absolute time when back-testing ends is controlled through `BACKTEST_END`.

Forward-testing is enabled with `DEV_MODE=false`. The absolute time when forward-testing starts is controlled through `BACKTEST_END`.

It is recommended to select `BACKTEST_END` so that your forward test period is at least 30% of your backtest period.

Example: if 100 trades are made during back-testing, you should pick `BACKTEST_END` so that you get 30 or more trades.

# What is [FTX](https://ftx.com/)?

My favorite crypto trading platform.
Want to try? Use my [referral](https://ftx.com/profile#a=tradingviewstuff) to get a 5% discount whe u sign up.

# Roadmap

- [x] 0.1.0: Symmetric Bot: some buy/sell config same (e.g. choice of MA)
- [ ] 0.2.0: Fully Asymetric Bot: buy/sell config completely unrelated
- [ ] 0.2.0: Improved UX: Rework and document the Inputs
