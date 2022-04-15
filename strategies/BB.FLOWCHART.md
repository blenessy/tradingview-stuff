# Bollinger Band strategy flowchart

```mermaid
flowchart LR
%% Definition of the components

%% Lower Band components
lbSource(LB MA Source)
lbMA(Moving Average)
lbDeviationSource(LB Deviation Source)
lbDeviationMA(Deviation MA)
lbDecision{+}

%% Upper Band components
ubSource(UB MA Source)
ubMA(Moving Average)
ubDeviationSource(UB Deviation Source)
ubDeviationMA(Deviation MA)
ubDecision{+}

shouldLong{Should\nLong}
shouldShort{Should\nShort}

%% Long position confirmation components
longSource(Long Source)
longOscSource(Long Conf Source)
longOscillator(Oscillator)
longMA(Moving Average)
longJoinOsc{ }
longJoinMA{ }

%% Short position confirmation components
shortSource(Short Source)
shortOscSource(Short Conf Source)
shortOscillator(Oscillator)
shortMA(Moving Average)
shortJoinOsc{ }
shortJoinMA{ }

takeShortPosition(Take Short Position)
takeLongPosition(Take Long Position)
style takeShortPosition fill:#0f9
style takeLongPosition fill:#0f9

%% Long position decision flow
subgraph Long Decision Flow
    direction LR

    subgraph Lower Band
        direction LR
        lbSource --> lbMA --> lbDecision
        lbDeviationSource --> lbDeviationMA --> lbDecision
    end

    subgraph Long Position Confirmation
        direction LR
        longOscSource --> longOscillator --> longJoinOsc
        longOscSource -- disabled --> longJoinOsc
        longJoinOsc --> longMA --> longJoinMA
        longJoinOsc -- disabled --> longJoinMA
    end

    lbDecision --> shouldLong
    longJoinMA --> shouldLong
    longSource --> shouldLong
end

%% Short position decision flow
subgraph Short Decision Flow
    direction LR
    subgraph Upper Band
        direction LR
        ubSource --> ubMA --> ubDecision
        ubDeviationSource --> ubDeviationMA --> ubDecision
    end

    subgraph Short Position Confirmation
        direction LR
        shortOscSource --> shortOscillator --> shortJoinOsc
        shortOscSource -- disabled --> shortJoinOsc
        shortJoinOsc --> shortMA --> shortJoinMA
        shortJoinOsc -- MA disabled --> shortJoinMA
    end

    ubDecision --> shouldShort
    shortJoinMA --> shouldShort
    shortSource --> shouldShort
end

shouldShort -- "Yes" --> takeShortPosition
shouldLong -- "Yes" --> takeLongPosition
