//    Copyright 2022 doki23
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

package org.doki23.prql4j;

import java.io.IOException;

public class PrqlCompiler {
    public static native String toSql(String query);
    public static native String toJson(String query);

    static {
        try {
            NativeLibraryLoader.getInstance().loadLibrary(null);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
