function search() {
    const nameParam = document.getElementById("name").value; // задаём значение параметра name
    const xhr = new XMLHttpRequest(); // создаем экземпляр объекта XMLHttpRequest

    xhr.onreadystatechange = function () { // функция, которая будет вызвана при изменении состояния запроса
        if (this.readyState === 4 && this.status === 200) { // проверяем, что запрос завершен и ответ сервера успешен
            const response = JSON.parse(xhr.responseText); // парсим ответ в JSON-формате
            console.log(response); // выводим ответ в консоль

            renderTable(response)
        }
    };

    xhr.open('GET', `/search/?name=${nameParam}`, true); // открываем соединение и указываем URL с параметром name
    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8'); // указываем тип контента
    xhr.send(); // отправляем GET-запрос
}

function renderTable(response) {
    const contactsElement = document.getElementById("contacts"); // получаем элемент, в который мы будем добавлять таблицу
    const table = createTable(response); // генерируем таблицу на основе данных контактов
    contactsElement.appendChild(table); // добавляем таблицу в элемент
}

function createTable(data) {
    const table = document.createElement("table"); // создаем элемент таблицы

    const headers = Object.keys(data[0]); // получаем заголовки столбцов из первого объекта в массиве данных
    const headerRow = document.createElement("tr"); // создаем элемент строки заголовка

    headers.forEach((header) => { // добавляем ячейки заголовка в строку заголовка
        const cell = document.createElement("th");
        cell.textContent = header;
        headerRow.appendChild(cell);
    });

    table.appendChild(headerRow); // добавляем строку заголовка в таблицу

    data.forEach((row) => { // добавляем строки данных в таблицу
        const tableRow = document.createElement("tr");

        headers.forEach((header) => { // добавляем ячейки данных в строку данных
            const cell = document.createElement("td");
            cell.textContent = row[header];
            tableRow.appendChild(cell);
        });

        table.appendChild(tableRow); // добавляем строку данных в таблицу
    });

    return table; // возвращаем готовую таблицу
}
