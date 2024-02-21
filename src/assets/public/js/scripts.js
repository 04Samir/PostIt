$(() => {
    function showSearchBox () {
        $("#searchInputBox").val("");
        $("#topics-list").html("<li>No Topics Found</li>");
        $("#posts-list").html("<li>No Posts Found</li>");
        $("#searchBox, #searchContainer").show();
        $("#searchInputBox").trigger("focus");
    };

    function hideSearchBox() {
        $("#searchBox, #searchContainer").hide();
    };
    hideSearchBox();

    $("#searchInput").on("click", function () {
        showSearchBox();
    });

    $("#searchInputBox").on("keyup", function () {
        const query = $(this).val();

        if (!query.trim()) {
            $("#topics-list").html("<li>No Topics Found</li>");
            $("#posts-list").html("<li>No Posts Found</li>");
            return;
        };

        $.ajax({
            type: "GET",
            url: `${baseUrl}/search?q=${query}`,
            headers: {
                "Accept": "application/json"
            },
            success: (data) => {
                if ((!data) || (data.topics.length === 0 && data.posts.length === 0)) {
                    $("#topics-list").html("<li>No Topics Found</li>");
                    $("#posts-list").html("<li>No Posts Found</li>");
                    return;
                };

                $("#topics-list").html("");
                $("#posts-list").html("");

                if (data.topics && data.topics.length > 0) {
                    data.topics.forEach(topic => {
                        $("#topics-list").append("<li><a href='" + topic.url + "'>" + topic.label + "</a></li>");
                    });
                } else {
                    $("#topics-list").append("<li>No topics found</li>");
                }

                if (data.posts && data.posts.length > 0) {
                    data.posts.forEach(post => {
                        $("#posts-list").append("<li><a href='" + post.url + "'>" + post.label + "</a></li>");
                    });
                } else {
                    $("#posts-list").append("<li>No posts found</li>");
                }
            },
            error: (error) => {
                console.error(error);
            }
        });
    });

    $("#searchFormBox").on("submit", function (event) {
        event.preventDefault();
        const query = $("#searchInputBox").val();
        if (!query.trim()) return;
        window.location.href = `${baseUrl}/search?q=${query}`;
    });

    $(document).on("mousedown", function (e) {
        const container = $("#searchBox");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            hideSearchBox();
        };
    });

    $("#searchBox").on("mousedown", function (e) {
        e.stopPropagation();
    });

});


$(() => {
    const timeElements = $(".post-time");

    timeElements.each(function () {
        const createdAt = new Date($(this).data("created-at"));
        const now = new Date();

        const timeDifference = now - createdAt;
        const secondsDifference = Math.floor(timeDifference / 1000);

        const minute = 60;
        const hour = minute * 60;
        const day = hour * 24;
        const month = day * 30;

        let displayTime;
        if (secondsDifference < minute) {
            displayTime = `${secondsDifference} Second${secondsDifference !== 1 ? "s" : ""} Ago`;
        } else if (secondsDifference < hour) {
            displayTime = `${Math.floor(secondsDifference / minute)} Minute${Math.floor(secondsDifference / minute) !== 1 ? "s" : ""} Ago`;
        } else if (secondsDifference < day) {
            displayTime = `${Math.floor(secondsDifference / hour)} Hour${Math.floor(secondsDifference / hour) !== 1 ? "s" : ""} Ago`;
        } else if (secondsDifference < month) {
            displayTime = `${Math.floor(secondsDifference / day)} Day${Math.floor(secondsDifference / day) !== 1 ? "s" : ""} Ago`;
        } else {
            displayTime = `${Math.floor(secondsDifference / month)} Month${Math.floor(secondsDifference / month) !== 1 ? "s" : ""} Ago`;
        }
        $(this).text(displayTime);
    });
});
