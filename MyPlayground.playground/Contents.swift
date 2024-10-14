var age: Int? = nil
age = 25



if let unwrappedAge = age {
    print("Возраст: \(unwrappedAge)")
} else {
    print("Нет данных о возрасте")
}
