package com.exam.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QuestionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QuestionExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andContentIsNull() {
            addCriterion("content is null");
            return (Criteria) this;
        }

        public Criteria andContentIsNotNull() {
            addCriterion("content is not null");
            return (Criteria) this;
        }

        public Criteria andContentEqualTo(String value) {
            addCriterion("content =", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotEqualTo(String value) {
            addCriterion("content <>", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThan(String value) {
            addCriterion("content >", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThanOrEqualTo(String value) {
            addCriterion("content >=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThan(String value) {
            addCriterion("content <", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThanOrEqualTo(String value) {
            addCriterion("content <=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLike(String value) {
            addCriterion("content like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotLike(String value) {
            addCriterion("content not like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentIn(List<String> values) {
            addCriterion("content in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotIn(List<String> values) {
            addCriterion("content not in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentBetween(String value1, String value2) {
            addCriterion("content between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotBetween(String value1, String value2) {
            addCriterion("content not between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNull() {
            addCriterion("answer is null");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNotNull() {
            addCriterion("answer is not null");
            return (Criteria) this;
        }

        public Criteria andAnswerEqualTo(String value) {
            addCriterion("answer =", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotEqualTo(String value) {
            addCriterion("answer <>", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThan(String value) {
            addCriterion("answer >", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("answer >=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThan(String value) {
            addCriterion("answer <", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThanOrEqualTo(String value) {
            addCriterion("answer <=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLike(String value) {
            addCriterion("answer like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotLike(String value) {
            addCriterion("answer not like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerIn(List<String> values) {
            addCriterion("answer in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotIn(List<String> values) {
            addCriterion("answer not in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerBetween(String value1, String value2) {
            addCriterion("answer between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotBetween(String value1, String value2) {
            addCriterion("answer not between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andKeywordIsNull() {
            addCriterion("keyword is null");
            return (Criteria) this;
        }

        public Criteria andKeywordIsNotNull() {
            addCriterion("keyword is not null");
            return (Criteria) this;
        }

        public Criteria andKeywordEqualTo(String value) {
            addCriterion("keyword =", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordNotEqualTo(String value) {
            addCriterion("keyword <>", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordGreaterThan(String value) {
            addCriterion("keyword >", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordGreaterThanOrEqualTo(String value) {
            addCriterion("keyword >=", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordLessThan(String value) {
            addCriterion("keyword <", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordLessThanOrEqualTo(String value) {
            addCriterion("keyword <=", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordLike(String value) {
            addCriterion("keyword like", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordNotLike(String value) {
            addCriterion("keyword not like", value, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordIn(List<String> values) {
            addCriterion("keyword in", values, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordNotIn(List<String> values) {
            addCriterion("keyword not in", values, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordBetween(String value1, String value2) {
            addCriterion("keyword between", value1, value2, "keyword");
            return (Criteria) this;
        }

        public Criteria andKeywordNotBetween(String value1, String value2) {
            addCriterion("keyword not between", value1, value2, "keyword");
            return (Criteria) this;
        }

        public Criteria andAnalysisIsNull() {
            addCriterion("analysis is null");
            return (Criteria) this;
        }

        public Criteria andAnalysisIsNotNull() {
            addCriterion("analysis is not null");
            return (Criteria) this;
        }

        public Criteria andAnalysisEqualTo(String value) {
            addCriterion("analysis =", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisNotEqualTo(String value) {
            addCriterion("analysis <>", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisGreaterThan(String value) {
            addCriterion("analysis >", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisGreaterThanOrEqualTo(String value) {
            addCriterion("analysis >=", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisLessThan(String value) {
            addCriterion("analysis <", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisLessThanOrEqualTo(String value) {
            addCriterion("analysis <=", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisLike(String value) {
            addCriterion("analysis like", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisNotLike(String value) {
            addCriterion("analysis not like", value, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisIn(List<String> values) {
            addCriterion("analysis in", values, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisNotIn(List<String> values) {
            addCriterion("analysis not in", values, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisBetween(String value1, String value2) {
            addCriterion("analysis between", value1, value2, "analysis");
            return (Criteria) this;
        }

        public Criteria andAnalysisNotBetween(String value1, String value2) {
            addCriterion("analysis not between", value1, value2, "analysis");
            return (Criteria) this;
        }

        public Criteria andDifficultyIsNull() {
            addCriterion("difficulty is null");
            return (Criteria) this;
        }

        public Criteria andDifficultyIsNotNull() {
            addCriterion("difficulty is not null");
            return (Criteria) this;
        }

        public Criteria andDifficultyEqualTo(Integer value) {
            addCriterion("difficulty =", value, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyNotEqualTo(Integer value) {
            addCriterion("difficulty <>", value, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyGreaterThan(Integer value) {
            addCriterion("difficulty >", value, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyGreaterThanOrEqualTo(Integer value) {
            addCriterion("difficulty >=", value, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyLessThan(Integer value) {
            addCriterion("difficulty <", value, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyLessThanOrEqualTo(Integer value) {
            addCriterion("difficulty <=", value, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyIn(List<Integer> values) {
            addCriterion("difficulty in", values, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyNotIn(List<Integer> values) {
            addCriterion("difficulty not in", values, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyBetween(Integer value1, Integer value2) {
            addCriterion("difficulty between", value1, value2, "difficulty");
            return (Criteria) this;
        }

        public Criteria andDifficultyNotBetween(Integer value1, Integer value2) {
            addCriterion("difficulty not between", value1, value2, "difficulty");
            return (Criteria) this;
        }

        public Criteria andOption1IsNull() {
            addCriterion("option1 is null");
            return (Criteria) this;
        }

        public Criteria andOption1IsNotNull() {
            addCriterion("option1 is not null");
            return (Criteria) this;
        }

        public Criteria andOption1EqualTo(String value) {
            addCriterion("option1 =", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1NotEqualTo(String value) {
            addCriterion("option1 <>", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1GreaterThan(String value) {
            addCriterion("option1 >", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1GreaterThanOrEqualTo(String value) {
            addCriterion("option1 >=", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1LessThan(String value) {
            addCriterion("option1 <", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1LessThanOrEqualTo(String value) {
            addCriterion("option1 <=", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1Like(String value) {
            addCriterion("option1 like", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1NotLike(String value) {
            addCriterion("option1 not like", value, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1In(List<String> values) {
            addCriterion("option1 in", values, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1NotIn(List<String> values) {
            addCriterion("option1 not in", values, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1Between(String value1, String value2) {
            addCriterion("option1 between", value1, value2, "option1");
            return (Criteria) this;
        }

        public Criteria andOption1NotBetween(String value1, String value2) {
            addCriterion("option1 not between", value1, value2, "option1");
            return (Criteria) this;
        }

        public Criteria andOption2IsNull() {
            addCriterion("option2 is null");
            return (Criteria) this;
        }

        public Criteria andOption2IsNotNull() {
            addCriterion("option2 is not null");
            return (Criteria) this;
        }

        public Criteria andOption2EqualTo(String value) {
            addCriterion("option2 =", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2NotEqualTo(String value) {
            addCriterion("option2 <>", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2GreaterThan(String value) {
            addCriterion("option2 >", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2GreaterThanOrEqualTo(String value) {
            addCriterion("option2 >=", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2LessThan(String value) {
            addCriterion("option2 <", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2LessThanOrEqualTo(String value) {
            addCriterion("option2 <=", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2Like(String value) {
            addCriterion("option2 like", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2NotLike(String value) {
            addCriterion("option2 not like", value, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2In(List<String> values) {
            addCriterion("option2 in", values, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2NotIn(List<String> values) {
            addCriterion("option2 not in", values, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2Between(String value1, String value2) {
            addCriterion("option2 between", value1, value2, "option2");
            return (Criteria) this;
        }

        public Criteria andOption2NotBetween(String value1, String value2) {
            addCriterion("option2 not between", value1, value2, "option2");
            return (Criteria) this;
        }

        public Criteria andOption3IsNull() {
            addCriterion("option3 is null");
            return (Criteria) this;
        }

        public Criteria andOption3IsNotNull() {
            addCriterion("option3 is not null");
            return (Criteria) this;
        }

        public Criteria andOption3EqualTo(String value) {
            addCriterion("option3 =", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3NotEqualTo(String value) {
            addCriterion("option3 <>", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3GreaterThan(String value) {
            addCriterion("option3 >", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3GreaterThanOrEqualTo(String value) {
            addCriterion("option3 >=", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3LessThan(String value) {
            addCriterion("option3 <", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3LessThanOrEqualTo(String value) {
            addCriterion("option3 <=", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3Like(String value) {
            addCriterion("option3 like", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3NotLike(String value) {
            addCriterion("option3 not like", value, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3In(List<String> values) {
            addCriterion("option3 in", values, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3NotIn(List<String> values) {
            addCriterion("option3 not in", values, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3Between(String value1, String value2) {
            addCriterion("option3 between", value1, value2, "option3");
            return (Criteria) this;
        }

        public Criteria andOption3NotBetween(String value1, String value2) {
            addCriterion("option3 not between", value1, value2, "option3");
            return (Criteria) this;
        }

        public Criteria andOption4IsNull() {
            addCriterion("option4 is null");
            return (Criteria) this;
        }

        public Criteria andOption4IsNotNull() {
            addCriterion("option4 is not null");
            return (Criteria) this;
        }

        public Criteria andOption4EqualTo(String value) {
            addCriterion("option4 =", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4NotEqualTo(String value) {
            addCriterion("option4 <>", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4GreaterThan(String value) {
            addCriterion("option4 >", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4GreaterThanOrEqualTo(String value) {
            addCriterion("option4 >=", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4LessThan(String value) {
            addCriterion("option4 <", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4LessThanOrEqualTo(String value) {
            addCriterion("option4 <=", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4Like(String value) {
            addCriterion("option4 like", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4NotLike(String value) {
            addCriterion("option4 not like", value, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4In(List<String> values) {
            addCriterion("option4 in", values, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4NotIn(List<String> values) {
            addCriterion("option4 not in", values, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4Between(String value1, String value2) {
            addCriterion("option4 between", value1, value2, "option4");
            return (Criteria) this;
        }

        public Criteria andOption4NotBetween(String value1, String value2) {
            addCriterion("option4 not between", value1, value2, "option4");
            return (Criteria) this;
        }

        public Criteria andOption5IsNull() {
            addCriterion("option5 is null");
            return (Criteria) this;
        }

        public Criteria andOption5IsNotNull() {
            addCriterion("option5 is not null");
            return (Criteria) this;
        }

        public Criteria andOption5EqualTo(String value) {
            addCriterion("option5 =", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5NotEqualTo(String value) {
            addCriterion("option5 <>", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5GreaterThan(String value) {
            addCriterion("option5 >", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5GreaterThanOrEqualTo(String value) {
            addCriterion("option5 >=", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5LessThan(String value) {
            addCriterion("option5 <", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5LessThanOrEqualTo(String value) {
            addCriterion("option5 <=", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5Like(String value) {
            addCriterion("option5 like", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5NotLike(String value) {
            addCriterion("option5 not like", value, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5In(List<String> values) {
            addCriterion("option5 in", values, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5NotIn(List<String> values) {
            addCriterion("option5 not in", values, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5Between(String value1, String value2) {
            addCriterion("option5 between", value1, value2, "option5");
            return (Criteria) this;
        }

        public Criteria andOption5NotBetween(String value1, String value2) {
            addCriterion("option5 not between", value1, value2, "option5");
            return (Criteria) this;
        }

        public Criteria andOption6IsNull() {
            addCriterion("option6 is null");
            return (Criteria) this;
        }

        public Criteria andOption6IsNotNull() {
            addCriterion("option6 is not null");
            return (Criteria) this;
        }

        public Criteria andOption6EqualTo(String value) {
            addCriterion("option6 =", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6NotEqualTo(String value) {
            addCriterion("option6 <>", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6GreaterThan(String value) {
            addCriterion("option6 >", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6GreaterThanOrEqualTo(String value) {
            addCriterion("option6 >=", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6LessThan(String value) {
            addCriterion("option6 <", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6LessThanOrEqualTo(String value) {
            addCriterion("option6 <=", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6Like(String value) {
            addCriterion("option6 like", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6NotLike(String value) {
            addCriterion("option6 not like", value, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6In(List<String> values) {
            addCriterion("option6 in", values, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6NotIn(List<String> values) {
            addCriterion("option6 not in", values, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6Between(String value1, String value2) {
            addCriterion("option6 between", value1, value2, "option6");
            return (Criteria) this;
        }

        public Criteria andOption6NotBetween(String value1, String value2) {
            addCriterion("option6 not between", value1, value2, "option6");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreatorIsNull() {
            addCriterion("creator is null");
            return (Criteria) this;
        }

        public Criteria andCreatorIsNotNull() {
            addCriterion("creator is not null");
            return (Criteria) this;
        }

        public Criteria andCreatorEqualTo(String value) {
            addCriterion("creator =", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotEqualTo(String value) {
            addCriterion("creator <>", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorGreaterThan(String value) {
            addCriterion("creator >", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorGreaterThanOrEqualTo(String value) {
            addCriterion("creator >=", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorLessThan(String value) {
            addCriterion("creator <", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorLessThanOrEqualTo(String value) {
            addCriterion("creator <=", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorLike(String value) {
            addCriterion("creator like", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotLike(String value) {
            addCriterion("creator not like", value, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorIn(List<String> values) {
            addCriterion("creator in", values, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotIn(List<String> values) {
            addCriterion("creator not in", values, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorBetween(String value1, String value2) {
            addCriterion("creator between", value1, value2, "creator");
            return (Criteria) this;
        }

        public Criteria andCreatorNotBetween(String value1, String value2) {
            addCriterion("creator not between", value1, value2, "creator");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeIsNull() {
            addCriterion("question_type is null");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeIsNotNull() {
            addCriterion("question_type is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeEqualTo(Integer value) {
            addCriterion("question_type =", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeNotEqualTo(Integer value) {
            addCriterion("question_type <>", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeGreaterThan(Integer value) {
            addCriterion("question_type >", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("question_type >=", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeLessThan(Integer value) {
            addCriterion("question_type <", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeLessThanOrEqualTo(Integer value) {
            addCriterion("question_type <=", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeIn(List<Integer> values) {
            addCriterion("question_type in", values, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeNotIn(List<Integer> values) {
            addCriterion("question_type not in", values, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeBetween(Integer value1, Integer value2) {
            addCriterion("question_type between", value1, value2, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("question_type not between", value1, value2, "questionType");
            return (Criteria) this;
        }

        public Criteria andSubjectIsNull() {
            addCriterion("subject is null");
            return (Criteria) this;
        }

        public Criteria andSubjectIsNotNull() {
            addCriterion("subject is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectEqualTo(Integer value) {
            addCriterion("subject =", value, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectNotEqualTo(Integer value) {
            addCriterion("subject <>", value, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectGreaterThan(Integer value) {
            addCriterion("subject >", value, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject >=", value, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectLessThan(Integer value) {
            addCriterion("subject <", value, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectLessThanOrEqualTo(Integer value) {
            addCriterion("subject <=", value, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectIn(List<Integer> values) {
            addCriterion("subject in", values, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectNotIn(List<Integer> values) {
            addCriterion("subject not in", values, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectBetween(Integer value1, Integer value2) {
            addCriterion("subject between", value1, value2, "subject");
            return (Criteria) this;
        }

        public Criteria andSubjectNotBetween(Integer value1, Integer value2) {
            addCriterion("subject not between", value1, value2, "subject");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}