EXPECTED_VERSION="3.35.0"

INSTALLED_VERSION=$(flutter --version | head -n 1)

echo "version instalada:"
echo "$INSTALLED_VERSION"

echo "$version requerida"
echo "$EXPECTED_VERSION"

echo "$INSTALLED_VERSION" | grep "$EXPECTED_VERSION"