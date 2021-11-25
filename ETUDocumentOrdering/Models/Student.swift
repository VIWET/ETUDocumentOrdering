import Foundation

/*
 URL: https:lk.etu.ru/api/profile/0
 
 JSON Responce:
 
 {
     "id": 318652,
     "first_name": "Дмитрий",
     "second_name": "Сидоров",
     "middle_name": "Александрович",
     "fio": "Сидоров Дмитрий Александрович",
     "initials": "Сидоров Д. А.",
     "position": "Учащийся",
     "additional_info": "",
     "is_show_in_contact_list": 1,
     "photo_id": null,
     "photo_url": "/assets/images/student-3-4.jpeg",
     "worker_positions": [],
     "has_notifications_time": true,
     "notifications_start_at": "09:00:00",
     "notifications_finish_at": "21:00:00",
     "mobile_phone": "+7-921-207-99-77",
     "rf_mobile": "9212079977",
     "email": "VIWET42@yandex.ru",
     "student_email": "dasidorov@stud.eltech.ru",
     "birth_date": "2000-12-12",
     "dict_sex_id": 1,
     "dict_citizenship_id": 3,
     "has_active_distant_education_application": false,
     "educations": [
         {
             "id": 17338,
             "student_card_number": "837113",
             "begda": "2018-09-01",
             "endda": "2022-08-31",
             "personal_number": "4490318",
             "is_foreigner": 0,
             "dict_fin_sources": {
                 "id": 1,
                 "mmiis_id": 1,
                 "begda": "1800-01-01",
                 "endda": "9999-12-31",
                 "dv": "Б",
                 "fdv": "Бюджет",
                 "endv": "Бюджет",
                 "dict_common_fin_source_id": 1,
                 "label": "Бюджет",
                 "value": 1
             },
             "dict_target_organizations": null,
             "dict_education_statuses": {
                 "id": 2,
                 "mmiis_id": 1,
                 "begda": "1800-01-01",
                 "endda": "9999-12-31",
                 "dv": "Уч",
                 "fdv": "Учащийся",
                 "label": "Учащийся",
                 "value": 2
             },
             "is_group_leader": "0",
             "is_course_leader": "0",
             "dict_faculties": {
                 "id": 3,
                 "mmiis_id": 26,
                 "begda": "1800-01-01",
                 "endda": "9999-12-31",
                 "dv": "ФКТИ",
                 "fdv": "Факультет компьютерных технологий и информатики",
                 "label": "Факультет компьютерных технологий и информатики",
                 "value": 3
             },
             "dict_edu_forms": {
                 "id": 1,
                 "mmiis_id": 1,
                 "begda": "1800-01-01",
                 "endda": "9999-12-31",
                 "dv": "ОФ",
                 "fdv": "Очная форма",
                 "endv": "Очная форма",
                 "label": "Очная форма",
                 "value": 1
             },
             "dict_edu_directions": {
                 "id": 429,
                 "dict_edu_level_id": 2,
                 "code": "09.03.02",
                 "duration": "4.00",
                 "dv": "Информационные системы и технологии",
                 "fdv": "Информационные системы и технологии",
                 "endv": "Информационные системы и технологии",
                 "ugs_code": "09.00.00",
                 "mmiis_id": 1743,
                 "label": "09.03.02 - Информационные системы и технологии",
                 "value": 429,
                 "edu_level": {
                     "id": 2,
                     "mmiis_id": 2,
                     "begda": "1800-01-01",
                     "endda": "9999-12-31",
                     "dv": "ВПО-Бакалавры",
                     "fdv": "ВПО-Бакалавры",
                     "endv": "ВПО-Бакалавры",
                     "label": "ВПО-Бакалавры",
                     "value": 2
                 }
             },
             "dict_edu_levels": {
                 "id": 2,
                 "mmiis_id": 2,
                 "begda": "1800-01-01",
                 "endda": "9999-12-31",
                 "dv": "ВПО-Бакалавры",
                 "fdv": "ВПО-Бакалавры",
                 "endv": "ВПО-Бакалавры",
                 "label": "ВПО-Бакалавры",
                 "value": 2
             },
             "dict_edu_profiles": {
                 "id": 275,
                 "dict_edu_direction_id": 429,
                 "code": "09.03.02_06",
                 "dv": "Информационные системы и технологии в бизнесе",
                 "fdv": "Информационные системы и технологии в бизнесе",
                 "endv": "Информационные системы и технологии в бизнесе",
                 "dict_kaf_id": 1,
                 "mmiis_id": 361,
                 "label": "Информационные системы и технологии в бизнесе",
                 "value": 275
             },
             "course": 4,
             "edu_groups": {
                 "id": 6215,
                 "mmiis_id": 20271,
                 "indek_id": null,
                 "name": "8371",
                 "dict_edu_form_id": 1,
                 "dict_faculty_id": 3,
                 "dict_edu_profile_id": 275,
                 "created_at": "2021-09-02T15:27:51.000000Z",
                 "updated_at": "2021-09-02T15:27:51.000000Z",
                 "course": 4,
                 "dict_edu_year_id": 11,
                 "dict_edu_direction_id": 429,
                 "edu_plan_id": 2368,
                 "faculty": {
                     "id": 3,
                     "mmiis_id": 26,
                     "begda": "1800-01-01",
                     "endda": "9999-12-31",
                     "dv": "ФКТИ",
                     "fdv": "Факультет компьютерных технологий и информатики",
                     "label": "Факультет компьютерных технологий и информатики",
                     "value": 3
                 },
                 "edu_form": {
                     "id": 1,
                     "mmiis_id": 1,
                     "begda": "1800-01-01",
                     "endda": "9999-12-31",
                     "dv": "ОФ",
                     "fdv": "Очная форма",
                     "endv": "Очная форма",
                     "label": "Очная форма",
                     "value": 1
                 },
                 "edu_direction": {
                     "id": 429,
                     "dict_edu_level_id": 2,
                     "code": "09.03.02",
                     "duration": "4.00",
                     "dv": "Информационные системы и технологии",
                     "fdv": "Информационные системы и технологии",
                     "endv": "Информационные системы и технологии",
                     "ugs_code": "09.00.00",
                     "mmiis_id": 1743,
                     "label": "09.03.02 - Информационные системы и технологии",
                     "value": 429,
                     "edu_level": {
                         "id": 2,
                         "mmiis_id": 2,
                         "begda": "1800-01-01",
                         "endda": "9999-12-31",
                         "dv": "ВПО-Бакалавры",
                         "fdv": "ВПО-Бакалавры",
                         "endv": "ВПО-Бакалавры",
                         "label": "ВПО-Бакалавры",
                         "value": 2
                     }
                 },
                 "edu_profile": {
                     "id": 275,
                     "dict_edu_direction_id": 429,
                     "code": "09.03.02_06",
                     "dv": "Информационные системы и технологии в бизнесе",
                     "fdv": "Информационные системы и технологии в бизнесе",
                     "endv": "Информационные системы и технологии в бизнесе",
                     "dict_kaf_id": 1,
                     "mmiis_id": 361,
                     "label": "Информационные системы и технологии в бизнесе",
                     "value": 275
                 }
             }
         }
     ]
 }
 */

struct Student: Codable {
    var id: Int
    var fio: String
    var educations: [Education]
    
    enum CodingKeys: String, CodingKey {
        case id, fio, educations
    }
}

struct Education: Codable{
    var id: Int
    var studentCardNumber: String
    let beginDate: String
    let endDate: String
    let faculty: Faculty
    let direction: Direction
    
    enum CodingKeys: String, CodingKey {
        case id
        case studentCardNumber = "student_card_number"
        case beginDate = "begda"
        case endDate = "endda"
        case faculty = "dict_faculties"
        case direction = "dict_edu_directions"
    }
    
    func getFullEducationTitle() -> String {
        return beginDate + " - " + endDate + " | " + faculty.title + ": " + direction.label
    }
}

struct Faculty: Codable {
    var id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "dv"
    }
}

struct Direction: Codable {
    var id: Int
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case id, label
    }
}
