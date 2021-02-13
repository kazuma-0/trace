// To parse this JSON data, do
//
//     final resParse = resParseFromJson(jsonString);

import 'dart:convert';

ResParse resParseFromJson(String str) => ResParse.fromJson(json.decode(str));

String resParseToJson(ResParse data) => json.encode(data.toJson());

class ResParse {
    ResParse({
        this.rawDocsCount,
        this.rawDocsSearchTime,
        this.reRankSearchTime,
        this.cacheHit,
        this.trial,
        this.docs,
        this.limit,
        this.limitTtl,
        this.quota,
        this.quotaTtl,
    });

    int rawDocsCount;
    int rawDocsSearchTime;
    int reRankSearchTime;
    bool cacheHit;
    int trial;
    List<Doc> docs;
    int limit;
    int limitTtl;
    int quota;
    int quotaTtl;

    factory ResParse.fromJson(Map<String, dynamic> json) => ResParse(
        rawDocsCount: json["RawDocsCount"],
        rawDocsSearchTime: json["RawDocsSearchTime"],
        reRankSearchTime: json["ReRankSearchTime"],
        cacheHit: json["CacheHit"],
        trial: json["trial"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        limit: json["limit"],
        limitTtl: json["limit_ttl"],
        quota: json["quota"],
        quotaTtl: json["quota_ttl"],
    );

    Map<String, dynamic> toJson() => {
        "RawDocsCount": rawDocsCount,
        "RawDocsSearchTime": rawDocsSearchTime,
        "ReRankSearchTime": reRankSearchTime,
        "CacheHit": cacheHit,
        "trial": trial,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
        "limit": limit,
        "limit_ttl": limitTtl,
        "quota": quota,
        "quota_ttl": quotaTtl,
    };
}

class Doc {
    Doc({
        this.from,
        this.to,
        this.anilistId,
        this.at,
        this.season,
        this.anime,
        this.filename,
        this.episode,
        this.tokenthumb,
        this.similarity,
        this.title,
        this.titleNative,
        this.titleChinese,
        this.titleEnglish,
        this.titleRomaji,
        this.malId,
        this.synonyms,
        this.synonymsChinese,
        this.isAdult,
    });

    double from;
    double to;
    int anilistId;
    double at;
    String season;
    String anime;
    String filename;
    dynamic episode;
    String tokenthumb;
    double similarity;
    String title;
    String titleNative;
    String titleChinese;
    String titleEnglish;
    String titleRomaji;
    int malId;
    List<String> synonyms;
    List<String> synonymsChinese;
    bool isAdult;

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        from: json["from"].toDouble(),
        to: json["to"].toDouble(),
        anilistId: json["anilist_id"],
        at: json["at"].toDouble(),
        season: json["season"],
        anime: json["anime"],
        filename: json["filename"],
        episode: json["episode"],
        tokenthumb: json["tokenthumb"],
        similarity: json["similarity"].toDouble(),
        title: json["title"],
        titleNative: json["title_native"],
        titleChinese: json["title_chinese"],
        titleEnglish: json["title_english"],
        titleRomaji: json["title_romaji"],
        malId: json["mal_id"],
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        synonymsChinese: List<String>.from(json["synonyms_chinese"].map((x) => x)),
        isAdult: json["is_adult"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "anilist_id": anilistId,
        "at": at,
        "season": season,
        "anime": anime,
        "filename": filename,
        "episode": episode,
        "tokenthumb": tokenthumb,
        "similarity": similarity,
        "title": title,
        "title_native": titleNative,
        "title_chinese": titleChinese,
        "title_english": titleEnglish,
        "title_romaji": titleRomaji,
        "mal_id": malId,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "synonyms_chinese": List<dynamic>.from(synonymsChinese.map((x) => x)),
        "is_adult": isAdult,
    };
}
