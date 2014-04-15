doits
metacelloPrimeRegistryFor10beta32
  [ self metacelloPrimeRegistry ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show:
            'Error during #metacelloPrimeRegistry:' , ex description printString
                , 'You should rerun the command after the load completes' ]