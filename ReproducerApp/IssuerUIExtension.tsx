import React from 'react';
import { Text, View } from 'react-native';

import NativeShareUIModule from './app/spec/NativeShareUIModule';

function IssuerUIExtension() {
  return (
    <View style={{ flex: 1, backgroundColor: 'red' }}>
      <Text
        style={{ color: 'white', textAlign: 'center', marginTop: 20 }}
        onPress={() => NativeShareUIModule.completeRequest('true')}
      >
        Issuer UI Extension Placeholder
      </Text>
    </View>
  );
}

export default IssuerUIExtension;
