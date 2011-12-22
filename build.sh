set -e

echo "Building for iPhone Simulator 5.0..."
xcodebuild -project ChaiOneUtils.xcodeproj -target ChaiOneUtils -configuration Debug -sdk iphonesimulator5.0 clean build

echo "Building for iPhone Device 5.0..."
xcodebuild -project ChaiOneUtils.xcodeproj -target ChaiOneUtils -configuration Debug -sdk iphoneos5.0 clean build