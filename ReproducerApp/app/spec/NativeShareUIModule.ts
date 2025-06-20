import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  completeRequest(isCompleted: string): Promise<void>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('NativeShareUIModule');
