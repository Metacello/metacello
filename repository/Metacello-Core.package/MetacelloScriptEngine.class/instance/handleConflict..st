handlers
handleConflict: exception
    ^ (self options at: #'onConflict' ifAbsent: [ ^ exception pass ]) cull: exception cull: self