# Bollinger Band strategy flowchart

```mermaid
flowchart LR
%% Definition of the components

%% Lower Band components
lbSource(Source)
lbMA(Moving Average)
lbDeviationSource(Deviation Source)
lbDeviationMA(Deviation MA)
lbDecision{+}

%% Upper Band components
ubSource(Source)
ubMA(Moving Average)
ubDeviationSource(Deviation Source)
ubDeviationMA(Deviation MA)
ubDecision{+}

shouldLong{Should \n Long}
shouldShort{Should \n Short}

%% Long position confirmation components
longSource(Source)
longOscillator(Oscillator)
longMA(Moving Average)

%% Short position confirmation components
shortSource(Source)
shortOscillator(Oscillator)
shortMA(Moving Average)

%% Generic position confirmation components
cfrmSource(Source)
cfrmOscillator(Oscillator)
cfrmOscillatorMA(Moving Average)
cfrmPosition{Position \n Confirmed}

takePosition(Take Position)
style takePosition fill:#0f9

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
        longSource --> longOscillator --> longMA
    end

    lbDecision -- Yes --> shouldLong
    longMA --> shouldLong    
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
        shortSource --> shortOscillator --> shortMA
    end

    ubDecision --> shouldShort
    shortMA --> shouldShort
end

%% Position Confirmation
subgraph Position Confirmation
    direction LR

    cfrmSource --> cfrmOscillator --> cfrmPosition
    cfrmOscillator -- optional --> cfrmOscillatorMA -- optional --> cfrmPosition

end

shouldShort -- "Yes" --> takePosition
shouldLong -- "Yes" --> takePosition
cfrmPosition -- "Yes" --> takePosition