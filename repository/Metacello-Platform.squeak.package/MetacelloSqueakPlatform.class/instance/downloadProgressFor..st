private
downloadProgressFor: url

    ^ self bypassProgressBars ifFalse: [
            [:total :amount| 
            HTTPProgress new
                total: total;
                amount: amount; 
                signal: 'Downloading ', url] ].